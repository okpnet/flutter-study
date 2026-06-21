import 'package:expression/src/conditions/fields/field.dart';
import '../visitor/visitor.dart';

/// 論理 AND を表す式ノード。
class AndExpression<T, R> extends Expression<T, R> {
  /// 左辺の式。
  final IExpression left;

  /// 右辺の式。
  final IExpression right;

  AndExpression({required this.left, required this.right, super.name});

  /// ビジターでこの AND ノードを処理します。
  ///
  /// [visitor]: 変換処理を行う [FieldVisitor]。
  @override
  // ignore: avoid_types_as_parameter_names
  R Function(T) accept(FieldVisitor visitor) => visitor.visitAnd(this);
}

/// 論理 OR を表す式ノード。
class OrExpression<T, R> extends Expression<T, R> {
  /// 左辺の式。
  final IExpression left;

  /// 右辺の式。
  final IExpression right;

  OrExpression({required this.left, required this.right, super.name});

  /// ビジターでこの OR ノードを処理します。
  ///
  /// [visitor]: 変換処理を行う [FieldVisitor]。
  @override
  // ignore: avoid_types_as_parameter_names
  R Function(T) accept(FieldVisitor visitor) => visitor.visitOr(this);
}
