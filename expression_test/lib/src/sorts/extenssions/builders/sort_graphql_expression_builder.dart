import '../../../constants/constants.dart';
import '../../sort_extpressions/sort_expressions.dart';
import '../../sort_visitors/sort_visitors.dart';
import 'sort_expression_builders.dart';

///Expressionから式を構築する
class SortGraphqlExpressionBuilder<T> extends ISortExpressionBuilder<T>
    with SortBuilderExpressionMixin<T> {
  @override
  final ISortVisitor<T> visitor;

  SortGraphqlExpressionBuilder() : visitor = SortGraphQLVisitor<T>();

  MapCallBack<T> build(SortExpression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      if (result is! Map<String, dynamic>) {
        throw AssertionError(
          'The ${result.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type ${ListCallBack.toString()}, because it was of type${result.toString()}.',
        );
      }
      return {ORDER_BY.split(' ').join('_').toLowerCase(): result};
    };
  }
}
