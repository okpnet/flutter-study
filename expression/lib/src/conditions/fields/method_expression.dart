import '../visitor/visitor.dart';
import 'field.dart';

/// 範囲チェックを表す式ノード。
///
/// [value] が [min] 以上 [max] 以下かを評価します。
class BetweenExpression<T, V, R> extends Expression<T, R> {
  /// 比較対象の値を表す式。
  final Expression<T, V> value;

  /// 下限を表す式。
  final Expression min;

  /// 上限を表す式。
  final Expression max;

  BetweenExpression({
    required this.value,
    required this.min,
    required this.max,
  });

  /// ビジターでこのノードを処理します。
  ///
  /// [visitor]: このノードを変換する [FieldVisitor]。
  /// 戻り値は `R Function(T)` 型の評価関数です。
  @override
  R Function(T) accept(FieldVisitor visitor) {
    final r = R.toString();
    final t = T.toString();
    return visitor.visitBetween(this);
  }
}

/// 値がリストに含まれるかを表す式ノード。
///
/// 右辺の [list] は `Iterable` である必要があります。
class InExpression<R> extends Expression<dynamic, R> {
  /// チェック対象の式。
  final Expression value;

  /// 値の集合を表す式。
  final Expression list;

  InExpression({required this.value, required this.list});

  /// ビジターでこのノードを処理します。
  ///
  /// [visitor]: このノードを変換する [FieldVisitor]。
  /// 戻り値は `R Function(T)` 型の評価関数です。
  @override
  R Function(dynamic) accept(FieldVisitor visitor) {
    return visitor.visitIn(this);
  }
}
