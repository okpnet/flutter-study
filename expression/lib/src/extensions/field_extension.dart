import '../../expression.dart';

/// フィールド選択や比較を簡潔に書くための DSL 拡張。
///
/// `R Function(T)` 型に対して `expr` を取り、さまざまな比較式を生成します。
extension FieldExpressionDsl<T, R> on R Function(T) {
  /// この関数を `FieldExpression` に変換します。
  FieldExpression<T, R> get expr => FieldExpression(field: this);

  /// 等価比較: 左辺が [value] と等しいか。
  Expression eq(R value) => OperatorExpression.equal(
    left: expr,
    right: ValueExpression(value: value),
  );

  /// 非等価比較: 左辺が [value] と異なるか。
  Expression ne(R value) => OperatorExpression.unEqual(
    left: expr,
    right: ValueExpression(value: value),
  );

  /// 小なり比較: 左辺 < [value]
  Expression lt(R value) => OperatorExpression.lessThan(
    left: expr,
    right: ValueExpression(value: value),
  );

  /// 大なり比較: 左辺 > [value]
  Expression gt(R value) => OperatorExpression.greaterThan(
    left: expr,
    right: ValueExpression(value: value),
  );

  /// 先頭一致: 左辺 が [prefix] で始まるか。
  Expression startsWith(String prefix) => OperatorExpression.startWith(
    left: expr,
    right: ValueExpression(value: prefix),
  );

  /// 部分一致: 左辺 が [pattern] を含むか。
  Expression like(String pattern) => OperatorExpression.like(
    left: expr,
    right: ValueExpression(value: pattern),
  );

  /// 範囲チェック: 左辺 が [min] 以上 [max] 以下か。
  Expression between(R min, R max) => BetweenExpression(
    value: expr,
    min: ValueExpression(value: min),
    max: ValueExpression(value: max),
  );

  /// 包含チェック: 左辺 が [list] に含まれるか。
  Expression inList(List<R> list) => InExpression(
    value: expr,
    list: ValueExpression(value: list),
  );
}

/// オブジェクトからフィールド選択を簡潔に行うための拡張。
extension FieldSelector<T> on T {
  /// [selector] を使って `FieldExpression` を生成します。
  FieldExpression<T, R> field<R>(R Function(T) selector) {
    return FieldExpression(field: selector);
  }
}
