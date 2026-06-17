import '../../expression.dart';

/// 式同士を `&` や `|` で連結するための DSL 拡張。
extension ExpressionConnecterDsl on Expression {
  /// 論理 AND を表す `AndExpression` を生成します。
  ///
  /// [other]: 右辺の式。
  Expression operator &(Expression other) =>
      AndExpression(left: this, right: other);

  /// 論理 OR を表す `OrExpression` を生成します。
  ///
  /// [other]: 右辺の式。
  Expression operator |(Expression other) =>
      OrExpression(left: this, right: other);

  // Expression not() => NotExpression(this);
}
