import 'package:expression/expression.dart';
import 'package:test/test.dart';

class SumFieldVisitor extends FieldVisitor {
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
  final visitor = SumFieldVisitor();

  group('FieldExpression & ValueExpression', () {
    test('FieldExpression returns field function', () {
      final expr = FieldExpression<int, int>(field: (x) => x * 2);
      final func = expr.accept<int, int>(visitor);
      expect(func(3), equals(6));
    });

    test('ValueExpression returns constant function', () {
      final expr = ValueExpression(value: 5);
      final func = expr.accept<int, int>(visitor);
      expect(func(999), equals(5));
    });

    test('AndExpression combines left and right', () {
      final left = FieldExpression<int, int>(field: (x) => x * 2);
      final right = ValueExpression(value: 3);
      final and = AndExpression(left: left, right: right);
      final func = and.accept(visitor);
      expect(func(4), equals(11));
    });
  });
  group('SQL string visitor', () {
    test('produces SQL string for field and value', () {
      final sqlVisitor = SqlVisitor();
      final left = FieldExpression<dynamic, String>(field: (_) => 'age');
      final right = ValueExpression(value: 30);
      final andExpr = AndExpression(left: left, right: right);
      final func = andExpr.accept(sqlVisitor);
      print(func(null));
      expect(func(null), equals('(age AND 30)'));
    });

    test('nested AND produces parentheses', () {
      final sqlVisitor = SqlVisitor();
      final f1 = FieldExpression<dynamic, String>(field: (_) => 'a');
      final f2 = FieldExpression<dynamic, String>(field: (_) => 'b');
      final v = ValueExpression(value: "x");
      final and1 = AndExpression(left: f1, right: f2);
      final and2 = AndExpression(left: and1, right: v);
      final func = and2.accept(sqlVisitor);
      print(func(null));
      expect(func(null), equals("((a AND b) AND 'x')"));
    });
  });
}
