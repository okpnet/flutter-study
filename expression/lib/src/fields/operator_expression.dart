import '../visitor/visitor.dart';
import 'field.dart';

class OperatorExpression extends Expression {
  final String _label;
  final Expression left;
  final Expression right;
  bool Function(dynamic, dynamic) delegate;
  OperatorExpression({
    required this.delegate,
    required this.left,
    required this.right,
    required String label,
    super.name,
  }) : _label = label;
  @override
  accept(IFieldVisitor visitor, left) {
    if (visitor case FieldVisitor instance) {
      return instance.operator(delegate, this.left, right);
    }
    throw ArgumentError(
      'visitor shall FieldVisitor<T, R> but,that ${visitor.runtimeType} type.',
    );
  }

  @override
  String toString() => _label;

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
}
