import 'package:expression/expression.dart';
import 'package:test/test.dart';

class NumericFieldVisitor extends FieldVisitor {
  @override
  R Function(T) visitAnd<T, R>(AndExpression ex) {
    final l = ex.left.accept<T, R>(this);
    final r = ex.right.accept<T, R>(this);
    return (T v) => ((l(v) as int) + (r(v) as int)) as R;
  }

  @override
  R Function(T) visitOr<T, R>(OrExpression ex) {
    final l = ex.left.accept<T, R>(this);
    final r = ex.right.accept<T, R>(this);
    return (T v) => ((l(v) as int) - (r(v) as int)) as R;
  }
}

void main() {
  group('OperatorExpression arithmetic', () {
    final visitor = NumericFieldVisitor();

    test('equal compares left and right correctly', () {
      final left = FieldExpression<int, int>(field: (x) => x * 2);
      final right = ValueExpression(value: 6);
      final expr = OperatorExpression.equal(left: left, right: right);
      final func = expr.accept<int, bool>(visitor);
      expect(func(3), isTrue);
      expect(func(4), isFalse);
    });

    test('lessThan and greaterThan behave as expected', () {
      final left = FieldExpression<int, int>(field: (x) => x + 1);
      final right = ValueExpression(value: 5);
      final lt = OperatorExpression.lessThan(left: left, right: right);
      final gt = OperatorExpression.greaterThan(left: left, right: right);
      final ltFunc = lt.accept<int, bool>(visitor);
      final gtFunc = gt.accept<int, bool>(visitor);
      expect(ltFunc(3), isTrue); // 3+1 < 5
      expect(ltFunc(5), isFalse);
      expect(gtFunc(6), isTrue); // 6+1 > 5
      expect(gtFunc(3), isFalse);
    });
  });

  group('OperatorExpression SQL string', () {
    test('produces SQL string using expression label', () {
      final sqlVisitor = SqlVisitor();
      final left = FieldExpression<dynamic, String>(field: (_) => 'age');
      final right = ValueExpression(value: 30);
      final expr = OperatorExpression.equal(
        left: left,
        right: right,
        label: '=',
      );

      final leftFunc = left.accept(sqlVisitor);
      final rightFunc = right.accept(sqlVisitor);
      final sql = '(${leftFunc(null)} ${expr.toString()} ${rightFunc(null)})';
      print(sql);
      expect(sql, equals('(age = 30)'));
    });

    test('nested operator expressions produce nested SQL', () {
      final sqlVisitor = SqlVisitor();
      final f1 = FieldExpression<dynamic, String>(field: (_) => 'a');
      final f2 = FieldExpression<dynamic, String>(field: (_) => 'b');
      final v = ValueExpression(value: "x");
      final op1 = OperatorExpression.equal(left: f1, right: f2, label: '=');
      final op2 = OperatorExpression.greaterThan(
        left: op1,
        right: v,
        label: '>',
      );

      // build SQL by evaluating children and using operator labels
      final leftFunc = op1.left.accept<dynamic, String>(sqlVisitor);
      final rightFunc = op1.right.accept<dynamic, String>(sqlVisitor);
      final op1Sql = '(${leftFunc(null)} ${op1.toString()} ${rightFunc(null)})';

      final op2Left = op1Sql;
      final op2Right = op2.right.accept<dynamic, String>(sqlVisitor)(null);
      final op2Sql = '(${op2Left} ${op2.toString()} ${op2Right})';
      print(op2Sql);
      expect(op2Sql, equals('((a = b) > \'x\')'));
    });
  });
}
