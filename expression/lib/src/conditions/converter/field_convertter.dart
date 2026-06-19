import '../fields/field.dart';
import '../visitor/visitor.dart';

/// 式ツリーを評価して関数を取り出すユーティリティ。
///
/// 内部的に [FieldVisitor] を用いてノードを処理します。
class FieldConvertter {
  /// 使用するビジター。
  final FieldVisitor fieldVisitor;

  FieldConvertter({required this.fieldVisitor});

  /// 与えられた [expression] を評価し、その結果の関数を返します。
  ///
  /// ジェネリクスの [T] は入力型、[R] は返却される関数の型です。
  R Function(T) evalute<T, R>(Expression<T, R> expression) {
    final r = R.toString();
    final t = T.toString();
    final test = expression.accept(fieldVisitor);
    final result = expression.accept(fieldVisitor) as dynamic;
    return result;
  }
}
