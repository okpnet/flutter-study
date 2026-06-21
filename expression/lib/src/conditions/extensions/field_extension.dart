import '../../../expression.dart';

/// フィールド選択や比較を簡潔に書くための DSL 拡張。
///
/// `R Function(T)` 型に対して `expr` を取り、さまざまな比較式を生成します。
extension FieldExpressionDsl<T, R> on FieldExpression<T, R> {
  /// この関数を `FieldExpression` に変換します。
  FieldExpression<T, R> get expr => this;

  /// 等価比較: 左辺が [value] と等しいか。
  Expression<T, V> eq<V>(R value) => OperatorExpression<T, V>.equal(
    left: expr,
    right: ValueExpression<R>(value: value),
  );

  /// 非等価比較: 左辺が [value] と異なるか。
  Expression<T, V> ne<V>(R value) => OperatorExpression<T, V>.unEqual(
    left: expr,
    right: ValueExpression<R>(value: value),
  );

  /// 小なり比較: 左辺 < [value]
  Expression<T, V> lt<V>(R value) => OperatorExpression<T, V>.lessThan(
    left: expr,
    right: ValueExpression<R>(value: value),
  );

  /// 大なり比較: 左辺 > [value]
  Expression<T, V> gt<V>(R value) => OperatorExpression<T, V>.greaterThan(
    left: expr,
    right: ValueExpression<R>(value: value),
  );

  /// 小なり比較: 左辺 < [value]
  Expression<T, V> le<V>(R value) => OperatorExpression<T, V>.lessThanEqual(
    left: expr,
    right: ValueExpression<R>(value: value),
  );

  /// 大なり比較: 左辺 > [value]
  Expression<T, V> ge<V>(R value) => OperatorExpression<T, V>.greaterThanEqual(
    left: expr,
    right: ValueExpression<R>(value: value),
  );

  /// 先頭一致: 左辺 が [prefix] で始まるか。
  Expression<T, V> startsWith<V>(String prefix) =>
      OperatorExpression<T, V>.startWith(
        left: expr,
        right: ValueExpression<String>(value: prefix),
      );
  Expression<T, V> endWith<V>(String prefix) =>
      OperatorExpression<T, V>.startWith(
        left: expr,
        right: ValueExpression<String>(value: prefix),
      );

  /// 部分一致: 左辺 が [pattern] を含むか。
  Expression<T, V> like<V>(String pattern) => OperatorExpression<T, V>.like(
    left: expr,
    right: ValueExpression<String>(value: pattern),
  );

  /// 範囲チェック: 左辺 が [min] 以上 [max] 以下か。
  Expression<T, V> between<S, V>(S min, S max) => BetweenExpression<T, V>(
    value: this,
    min: ValueExpression<S>(value: min),
    max: ValueExpression<S>(value: max),
  );

  /// 包含チェック: 左辺 が [list] に含まれるか。
  Expression inList(List<R> list) => InExpression(
    value: expr,
    list: ValueExpression(value: list),
  );
}

/// オブジェクトからフィールド選択を簡潔に行うための拡張。
class ExpressionHelper<T, R> {
  /// [selector] を使って `FieldExpression` を生成します。
  FieldExpression<T, V> field<V>(V Function(T) selector) =>
      FieldExpression<T, V>(field: selector);
}
