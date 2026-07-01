import '../../../constants/constants.dart';
import '../expressions.dart';
import '../../visitors/visitors.dart';

///GrapqlのWhere条件を構築する
class GraphqlExpressionBuilder<T> extends IBuilderExpression<T>
    with BuilderExpressionMixin<T> {
  @override
  final IVisitor<T> visitor;

  GraphqlExpressionBuilder() : visitor = GraphqlVisitor<T>();

  MapCallBack<T> build(Expression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      if (result is! Map<String, dynamic>) {
        throw AssertionError(
          'The ${func.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type bool, because it was of type${result.toString()}.',
        );
      }

      // ignore: unnecessary_cast
      return {WHERE.toLowerCase(): result};
    };
  }
}
