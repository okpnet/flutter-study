import '../visitor/visitor.dart';
import 'field.dart';

class StartWithExpression<T, R> extends Expression {
  final FieldExpression<T, R> left;
  final ValueExpression<T> right;
  StartWithExpression({required this.left, required this.right, super.name});

  @override
  accept(IFieldVisitor visitor, left) {
    if (visitor case FieldVisitor instance) {
      return instance.fieldeEvalute(field);
    }
    throw ArgumentError(
      'visitor shall FieldVisitor<T, R> but,that ${visitor.runtimeType} type.',
    );
  }
}
