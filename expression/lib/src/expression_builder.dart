import '../expression.dart';

/// 条件式ツリーを評価して関数に変換するビルダー。
///
/// ジェネリクスの [T] は入力値の型、[R] は返される関数の型を表します。
class ExpressionBuilder<T, R extends Function> {
  /// 内部で使用する [FieldConvertter] インスタンス。
  final FieldConvertter converter;

  ExpressionBuilder({required this.converter});

  /// 与えられた [expression] を評価して `T -> R` の関数を返します。
  ///
  /// [expression]: 評価対象の条件式ツリー。
  R build({T? value, required Expression Function(T? t) builder}) {
    final expr = builder(value);
    return converter.evalute(expr);
  }
}
