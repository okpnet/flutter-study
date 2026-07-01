import '../../../constants/constants.dart';
import '../expressions.dart';
import '../../visitors/visitors.dart';

///ListのWhere条件を構築する
class SqlExpressionBuilder<T> extends IBuilderExpression<T>
    with BuilderExpressionMixin<T> {
  @override
  final IVisitor<T> visitor;

  SqlExpressionBuilder() : visitor = SqlVisitor();

  SqlCallBack<T> build(Expression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      if (result is! String) {
        throw AssertionError(
          'The ${func.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type bool, because it was of type${result.toString()}.',
        );
      }
      // ignore: unnecessary_cast
      return result as String;
    };
  }
}
