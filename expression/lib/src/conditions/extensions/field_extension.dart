import '../../../expression.dart';

/// オブジェクトからフィールド選択を簡潔に行うための拡張。
class ExpressionHelper<T, R> {
  /// [selector] を使って `FieldExpression` を生成します。
  FieldExpression<T, V> field<V>(V Function(T) selector) =>
      FieldExpression<T, V>(field: selector);

  /// 等価比較: 左辺が [value] と等しいか。
  Expression<T, R> eq<V>(V value, V Function(T) selector) =>
      OperatorExpression<T, R>.equal(
        left: field(selector),
        right: ValueExpression(value: value),
      );

  /// 非等価比較: 左辺が [value] と異なるか。
  Expression<T, R> ne<V>(V value, V Function(T) selector) =>
      OperatorExpression<T, R>.unEqual(
        left: field(selector),
        right: ValueExpression(value: value),
      );

  /// 小なり比較: 左辺 < [value]
  Expression<T, R> lt<V>(V value, V Function(T) selector) =>
      OperatorExpression<T, R>.lessThan(
        left: field(selector),
        right: ValueExpression(value: value),
      );

  /// 大なり比較: 左辺 > [value]
  Expression<T, R> gt<V>(V value, V Function(T) selector) =>
      OperatorExpression<T, R>.greaterThan(
        left: field(selector),
        right: ValueExpression(value: value),
      );

  /// 小なり比較: 左辺 < [value]
  Expression<T, R> le<V>(V value, V Function(T) selector) =>
      OperatorExpression<T, R>.lessThanEqual(
        left: field(selector),
        right: ValueExpression(value: value),
      );

  /// 大なり比較: 左辺 > [value]
  Expression<T, R> ge<V>(V value, V Function(T) selector) =>
      OperatorExpression<T, R>.greaterThanEqual(
        left: field(selector),
        right: ValueExpression(value: value),
      );

  /// 先頭一致: 左辺 が [prefix] で始まるか。
  Expression<T, R> startsWith<V>(String prefix, String Function(T) selector) =>
      OperatorExpression<T, R>.startWith(
        left: field(selector),
        right: ValueExpression(value: prefix),
      );

  Expression<T, R> endWith<V>(String prefix, Stream Function(T) selector) =>
      OperatorExpression<T, R>.endWith(
        left: field(selector),
        right: ValueExpression(value: prefix),
      );

  /// 部分一致: 左辺 が [pattern] を含むか。
  Expression<T, R> like<V>(String pattern, String Function(T) selector) =>
      OperatorExpression<T, R>.like(
        left: field(selector),
        right: ValueExpression(value: pattern),
      );

  ///
  Expression<T, R> between<V>(V min, V max, V Function(T) selector) =>
      BetweenExpression<T, V, R>(
        value: selector as Expression<T, V>,
        min: ValueExpression<V>(value: min),
        max: ValueExpression<V>(value: max),
      );

  ///
  Expression<T, R> fieldToFiled<V>({
    bool isNot = false,
    required V Function(T) left,
    required V Function(T) rught,
  }) => OperatorExpression.equal(left: field(left), right: field(rught));

  ///
  Expression<T, R> toFiledUnEq<V>(V Function(T) left, V Function(T) rught) =>
      OperatorExpression.equal(left: field(left), right: field(rught));
}
