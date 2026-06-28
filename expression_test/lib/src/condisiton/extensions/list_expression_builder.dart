import '../expressions/expressions.dart';
import '../visitors/visitors.dart';

///ListのWhere条件を構築する
class ListExpressionBuilder<T> {
  final Visitor<T> visitor;

  ListExpressionBuilder() : visitor = ListVisitor();

  bool Function(T) build(Expression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      if (result is! bool) {
        throw AssertionError(
          'The ${func.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type bool, because it was of type${result.toString()}.',
        );
      }
      return result as bool;
    };
  }
}
