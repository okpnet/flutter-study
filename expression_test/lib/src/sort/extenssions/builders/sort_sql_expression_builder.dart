import '../../../constants/constants.dart';
import '../../sort_extpressions/sort_expressions.dart';
import '../../sort_visitors/sort_visitors.dart';
import 'sort_expression_builders.dart';

///Expressionから式を構築する
class SortSqlExpressionBuilder<T> extends ISortExpressionBuilder<T>
    with SortBuilderExpressionMixin<T> {
  @override
  final ISortVisitor<T> visitor;

  SortSqlExpressionBuilder() : visitor = SortSqlVisitor<T>();

  SqlCallBack<T> build(SortExpression expression) {
    final result = expression.accept(visitor);
    if (result is! SqlCallBack) {
      throw AssertionError(
        'The ${result.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type ${ListCallBack.toString()}, because it was of type${result.toString()}.',
      );
    }
    // ignore: unnecessary_cast
    return result as SqlCallBack;
  }
}
