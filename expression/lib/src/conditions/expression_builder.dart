import '../../expression.dart';

/// 条件式ツリーを評価して関数に変換するビルダー。
///
/// ジェネリクスの [T] は入力値の型、[R] は返される関数の型を表します。
class ExpressionBuilder<T, R> {
  /// 内部で使用する [FieldConvertter] インスタンス。
  final FieldConvertter converter;

  ExpressionBuilder({required this.converter});

  /// 与えられた [expression] を評価して `T -> R` の関数を返します。
  ///
  /// [expression]: 評価対象の条件式ツリー。
  R Function(T) build({
    required Expression<T, R> Function(ExpressionHelper<T, R>) builder,
  }) {
    // ignore: null_check_always_fails
    final expr = builder(ExpressionHelper<T, R>());
    final exprStr = expr.toString();
    final r = R.toString();
    final t = T.toString();
    final result = converter.evalute<T, R>(expr);
    return result;
  }
}
