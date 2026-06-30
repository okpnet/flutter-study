import 'package:expression_test/expression_test.dart';

///ビジタを持つビルダ
abstract class ISortExpressionBuilder<T> {
  ISortVisitor<T> get visitor;
}

///好きな値をとりださせるビルダ
mixin SortBuilderExpressionMixin<T> on ISortExpressionBuilder<T> {
  ValueCallBack<T> anyBuild(SortExpression expression) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      return result;
    };
  }
}
