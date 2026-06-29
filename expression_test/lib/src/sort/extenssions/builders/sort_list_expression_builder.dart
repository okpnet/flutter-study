import 'package:expression_test/expression_test.dart';

///Expressionから式を構築する
class SortListExpressionBuilder<T> {
  final SortListVisitor<T> visitor;

  SortListExpressionBuilder() : visitor = SortListVisitor<T>();

  ListCallBack build(SortExpression expression) {
    final result = expression.accept(visitor);
    if (result is! ListCallBack) {
      throw AssertionError(
        'The ${result.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type ${ListCallBack.toString()}, because it was of type${result.toString()}.',
      );
    }
    return result as ListCallBack;
  }
}
