import 'package:expression/src/fields/field.dart';
import '../visitor/visitor.dart';

/// 論理 AND を表す式ノード。
class AndExpression extends Expression {
  /// 左辺の式。
  final Expression left;

  /// 右辺の式。
  final Expression right;

  AndExpression({required this.left, required this.right, super.name});

  /// ビジターでこの AND ノードを処理します。
  ///
  /// [visitor]: 変換処理を行う [FieldVisitor]。
  @override
  // ignore: avoid_types_as_parameter_names
  R Function(T) accept<T, R>(FieldVisitor visitor) => visitor.visitAnd(this);
}

/// 論理 OR を表す式ノード。
class OrExpression extends Expression {
  /// 左辺の式。
  final Expression left;

  /// 右辺の式。
  final Expression right;

  OrExpression({required this.left, required this.right, super.name});

  /// ビジターでこの OR ノードを処理します。
  ///
  /// [visitor]: 変換処理を行う [FieldVisitor]。
  @override
  // ignore: avoid_types_as_parameter_names
  R Function(T) accept<T, R>(FieldVisitor visitor) => visitor.visitOr(this);
}
