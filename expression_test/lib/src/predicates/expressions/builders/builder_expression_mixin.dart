import '../../../constants/constants.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///ビジタを持つビルダ
abstract class IBuilderExpression<T> {
  IVisitor<T> get visitor;
}

///好きな値を取り出せるビルダ
mixin BuilderExpressionMixin<T> on IBuilderExpression<T> {
  ValueCallBack<T> anyBuild(Expression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      return result;
    };
  }
}
