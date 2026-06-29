import '../../sort_extpressions/sort_expressions.dart';
import '../../sort_visitors/sort_visitors.dart';

///Expressionから式を構築する
class SortSqlExpressionBuilder<T> {
  final SortSqlVisitor<T> visitor;

  SortSqlExpressionBuilder() : visitor = SortSqlVisitor<T>();

  SqlCallBack build(SortExpression expression) {
    final result = expression.accept(visitor);
    if (result is! SqlCallBack) {
      throw AssertionError(
        'The ${result.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type ${ListCallBack.toString()}, because it was of type${result.toString()}.',
      );
    }
    return result as SqlCallBack;
  }
}
