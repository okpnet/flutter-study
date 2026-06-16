import 'package:expression/expression.dart';
import 'package:test/test.dart';

class NumericFieldVisitor extends FieldVisitor<int, int> {
  @override
  int Function(int) andExpression(
    int Function(int) left,
    int Function(int) right,
  ) {
    return (int v) => left(v) + right(v);
  }

  @override
  int Function(int) orExpression(
    int Function(int) left,
    int Function(int) right,
  ) {
    return (int v) => left(v) - right(v);
  }

  // @override
  // bool Function(int) operator(
  //   bool Function(dynamic, dynamic) delegate,
  //   Expression left,
  //   Expression right,
  // ) {
  //   final l = eval(left) as int Function(int);
  //   final r = eval(right) as int Function(int);
  //   return (int v) => delegate(l(v), r(v));
  // }
}

class SqlFieldVisitor extends FieldVisitor<dynamic, String> {
  @override
  String Function(dynamic) andExpression(
    String Function(dynamic) left,
    String Function(dynamic) right,
  ) {
    return (dynamic v) => '(${left(v)} AND ${right(v)})';
  }

  @override
  String Function(dynamic) orExpression(
    String Function(dynamic) left,
    String Function(dynamic) right,
  ) {
    return (dynamic v) => '(${left(v)} OR ${right(v)})';
  }
}

void main() {
  group('OperatorExpression arithmetic', () {
    final visitor = NumericFieldVisitor();

    test('equal compares left and right correctly', () {
      final left = FieldExpression<int, int>(field: (x) => x * 2);
      final right = ValueExpression<int>(value: 6);
      final expr = OperatorExpression.equal(left: left, right: right);
      final func = expr.accept(visitor, null) as bool Function(int);
      expect(func(3), isTrue);
      expect(func(4), isFalse);
    });

    test('lessThan and greaterThan behave as expected', () {
      final left = FieldExpression<int, int>(field: (x) => x + 1);
      final right = ValueExpression<int>(value: 5);
      final lt = OperatorExpression.lessThan(left: left, right: right);
      final gt = OperatorExpression.greaterThan(left: left, right: right);
      final ltFunc = lt.accept(visitor, null);
      final gtFunc = gt.accept(visitor, 0);
      expect(ltFunc(3), isTrue); // 3+1 < 5
      expect(ltFunc(5), isFalse);
      expect(gtFunc(6), isTrue); // 6+1 > 5
      expect(gtFunc(3), isFalse);
    });
  });

  group('OperatorExpression SQL string', () {
    test('produces SQL string using expression label', () {
      final sqlVisitor = SqlFieldVisitor();
      final left = FieldExpression<dynamic, String>(field: (_) => 'age');
      final right = ValueExpression<String>(value: '30');
      final expr = OperatorExpression.equal(
        left: left,
        right: right,
        label: '=',
      );

      final leftFunc = sqlVisitor.eval(left);
      final rightFunc = sqlVisitor.eval(right);
      final sql = '(${leftFunc(null)} ${expr.toString()} ${rightFunc(null)})';
      expect(sql, equals('(age = 30)'));
    });

    test('nested operator expressions produce nested SQL', () {
      final sqlVisitor = SqlFieldVisitor();
      final f1 = FieldExpression<dynamic, String>(field: (_) => 'a');
      final f2 = FieldExpression<dynamic, String>(field: (_) => 'b');
      final v = ValueExpression<String>(value: "'x'");
      final op1 = OperatorExpression.equal(left: f1, right: f2, label: '=');
      final op2 = OperatorExpression.greaterThan(
        left: op1,
        right: v,
        label: '>',
      );

      // build SQL by evaluating children and using operator labels
      final leftFunc = sqlVisitor.eval(op1.left);
      final rightFunc = sqlVisitor.eval(op1.right);
      final op1Sql = '(${leftFunc(null)} ${op1.toString()} ${rightFunc(null)})';

      final op2Left = op1Sql;
      final op2Right = sqlVisitor.eval(op2.right)(null);
      final op2Sql = '(${op2Left} ${op2.toString()} ${op2Right})';

      expect(op2Sql, equals('((a = b) > \'x\')'));
    });
  });
}
