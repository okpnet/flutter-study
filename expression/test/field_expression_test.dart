import 'package:expression/expression.dart';
import 'package:test/test.dart';

class SumFieldVisitor extends FieldVisitor<int, int> {
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
  final visitor = SumFieldVisitor();

  group('FieldExpression & ValueExpression', () {
    test('FieldExpression returns field function', () {
      final expr = FieldExpression<int, int>(field: (x) => x * 2);
      final func = visitor.eval(expr);
      expect(func(3), equals(6));
    });

    test('ValueExpression returns constant function', () {
      final expr = ValueExpression<int>(value: 5);
      final func = visitor.eval(expr);
      expect(func(999), equals(5));
    });

    test('AndExpressison combines left and right', () {
      final left = FieldExpression<int, int>(field: (x) => x * 2);
      final right = ValueExpression<int>(value: 3);
      final and = AndExpressison(left: left, right: right);
      final func = visitor.eval(and);
      expect(func(4), equals(11));
    });
  });
  group('SQL string visitor', () {
    test('produces SQL string for field and value', () {
      final sqlVisitor = SqlFieldVisitor();
      final left = FieldExpression<dynamic, String>(field: (_) => 'age');
      final right = ValueExpression<String>(value: '30');
      final andExpr = AndExpressison(left: left, right: right);
      final func = sqlVisitor.eval(andExpr);
      print(func(null));
      expect(func(null), equals('(age AND 30)'));
    });

    test('nested AND produces parentheses', () {
      final sqlVisitor = SqlFieldVisitor();
      final f1 = FieldExpression<dynamic, String>(field: (_) => 'a');
      final f2 = FieldExpression<dynamic, String>(field: (_) => 'b');
      final v = ValueExpression<String>(value: "'x'");
      final and1 = AndExpressison(left: f1, right: f2);
      final and2 = AndExpressison(left: and1, right: v);
      final func = sqlVisitor.eval(and2);
      print(func(null));
      expect(func(null), equals("((a AND b) AND 'x')"));
    });
  });
}
