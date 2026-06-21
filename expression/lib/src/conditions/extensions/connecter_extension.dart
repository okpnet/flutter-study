import '../../../expression.dart';

/// 式同士を `&` や `|` で連結するための DSL 拡張。
extension ExpressionConnecterDsl<T, R> on Expression<T, R> {
  /// 論理 AND を表す `AndExpression` を生成します。
  ///
  /// [other]: 右辺の式。
  Expression<T, R> operator &(IExpression other) =>
      AndExpression<T, R>(left: this, right: other);

  /// 論理 OR を表す `OrExpression` を生成します。
  ///
  /// [other]: 右辺の式。
  Expression<T, R> operator |(IExpression other) =>
      OrExpression<T, R>(left: this, right: other);

  // Expression not() => NotExpression(this);
}
