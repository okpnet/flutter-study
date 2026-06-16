import 'package:expression/src/fields/field.dart';
import '../visitor/visitor.dart';

class AndExpressison extends Expression {
  final Expression left;
  final Expression right;
  AndExpressison({required this.left, required this.right, super.name});
  @override
  accept(IFieldVisitor visitor, left) {
    if (visitor case FieldVisitor instance) {
      return instance.andEvalute(this.left, right);
    }
    throw ArgumentError(
      'visitor shall FieldVisitor<T, R> but,that ${visitor.runtimeType} type.',
    );
  }
}

class OrExpressison extends Expression {
  final Expression left;
  final Expression right;
  OrExpressison({required this.left, required this.right, super.name});
  @override
  accept(IFieldVisitor visitor, left) {
    if (visitor case FieldVisitor instance) {
      return instance.orEvalute(this.left, right);
    }
    throw ArgumentError(
      'visitor shall FieldVisitor<T, R> but,that ${visitor.runtimeType} type.',
    );
  }
}
