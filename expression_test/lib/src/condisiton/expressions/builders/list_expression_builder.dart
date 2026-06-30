import '../../visitors/visitors.dart';
import '../expressions.dart';

typedef WhereCallBack<T> = bool Function(T);

///ListのWhere条件を構築する
class ListExpressionBuilder<T> extends IBuilderExpression<T>
    with BuilderExpressionMixin<T> {
  @override
  final IVisitor<T> visitor;

  ListExpressionBuilder() : visitor = ListVisitor();

  WhereCallBack<T> build(Expression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      if (result is! bool) {
        throw AssertionError(
          'The [${func.toString()}] result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type bool, because it was of type${result.toString()}.',
        );
      }
      // ignore: unnecessary_cast
      return result as bool;
    };
  }
}
