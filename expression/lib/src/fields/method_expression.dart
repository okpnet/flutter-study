import '../visitor/visitor.dart';
import 'field.dart';

/// 範囲チェックを表す式ノード。
///
/// [value] が [min] 以上 [max] 以下かを評価します。
class BetweenExpression extends Expression {
  /// 比較対象の値を表す式。
  final Expression value;

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
  R Function(T) accept<T, R>(FieldVisitor visitor) {
    return visitor.visitBetween(this);
  }
}

/// 値がリストに含まれるかを表す式ノード。
///
/// 右辺の [list] は `Iterable` である必要があります。
class InExpression extends Expression {
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
  R Function(T) accept<T, R>(FieldVisitor visitor) {
    return visitor.visitIn(this);
  }
}
