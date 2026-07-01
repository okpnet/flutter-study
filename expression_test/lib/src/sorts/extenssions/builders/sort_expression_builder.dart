import 'package:expression_test/expression_test.dart';

///Expressionから式を構築する
class SortExpressionBuilder {
  static R Function(T) build<T, R>(
    SortExpression expression,
    SortVisitor<T, R> visitor,
  ) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      if (result is! R) {
        throw AssertionError(
          'The ${func.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type R:${R.toString()}, because it was of type${result.toString()}.',
        );
      }
      // ignore: unnecessary_cast
      return result as R;
    };
  }
}
