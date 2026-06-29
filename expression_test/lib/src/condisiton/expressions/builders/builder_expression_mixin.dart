import '../../../constants/constants.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

abstract class IBuilderExpression<T> {
  IVisitor<T> get visitor;
}

mixin BuilderExpressionMixin<T> on IBuilderExpression<T> {
  ValueCallBack<T> anyBuild(Expression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      return result;
    };
  }
}
