import '../expression.dart';

///条件ツリーを循環するベースクラス
class ExpressionBuilder<T, R extends Function> {
  final FieldConvertter<T, R> converter;

  ExpressionBuilder({required this.converter});

  /// 条件式から「T → R」の関数を構築して返します
  R build(Expression expression) {
    final result = converter.evalute(expression);
    return result;
  }
}
