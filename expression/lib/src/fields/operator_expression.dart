import '../visitor/visitor.dart';
import 'field.dart';

/// 二項演算子を表す式ノード。
///
/// 左辺 [left] と右辺 [right] を評価して、 [delegate] により比較や判定を行います。
class OperatorExpression<R> extends Expression<dynamic, R> {
  /// 表示用ラベル（例: '=', '<', 'LIKE' など）。
  final String _label;

  /// 左辺の式。
  final Expression left;

  /// 右辺の式。
  final Expression right;

  String get lable => _label;

  /// 左右の評価結果を比較するデリゲート関数。
  bool Function(dynamic, dynamic) delegate;

  OperatorExpression({
    required this.delegate,
    required this.left,
    required this.right,
    required String label,
    super.name,
  }) : _label = label;

  /// ビジターでこの演算子ノードを処理します。
  ///
  /// [visitor]: ノードを評価・変換する [FieldVisitor]。
  /// 戻り値は `R Function(T)` 型の評価関数です。
  @override
  R Function(dynamic) accept(FieldVisitor visitor) {
    return visitor.visitOperator(this);
  }

  @override
  String toString() => _label;

  /// 等価比較を作るファクトリ。
  ///
  /// [left], [right]: 比較対象の式。
  factory OperatorExpression.equal({
    required Expression left,
    required Expression right,
    String? name,
    String label = '=',
  }) => OperatorExpression(
    delegate: (l, r) => l == r,
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.unEqual({
    required Expression left,
    required Expression right,
    String? name,
    String label = '<>',
  }) => OperatorExpression(
    delegate: (l, r) => l != r,
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.lessThan({
    required Expression left,
    required Expression right,
    String? name,
    String label = '<',
  }) => OperatorExpression(
    delegate: (l, r) => l < r,
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.lessThanEqual({
    required Expression left,
    required Expression right,
    String? name,
    String label = '<=',
  }) => OperatorExpression(
    delegate: (l, r) => l <= r,
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.greaterThan({
    required Expression left,
    required Expression right,
    String? name,
    String label = '>',
  }) => OperatorExpression(
    delegate: (l, r) => l > r,
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.greaterThanEqual({
    required Expression left,
    required Expression right,
    String? name,
    String label = '>=',
  }) => OperatorExpression(
    delegate: (l, r) => l >= r,
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.startWith({
    required Expression left,
    required Expression right,
    String? name,
    String label = 'START_WITH',
  }) => OperatorExpression(
    delegate: (l, r) => l.toString().startsWith(r.toString()),
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.endWith({
    required Expression left,
    required Expression right,
    String? name,
    String label = 'END_WITH',
  }) => OperatorExpression(
    delegate: (l, r) => l.toString().endsWith(r.toString()),
    label: label,
    left: left,
    right: right,
    name: name,
  );

  factory OperatorExpression.like({
    required Expression left,
    required Expression right,
    String? name,
    String label = 'LIKE',
  }) {
    return OperatorExpression(
      delegate: (l, r) => l.toString().contains(r.toString()),
      label: label,
      left: left,
      right: right,
      name: name,
    );
  }
}
