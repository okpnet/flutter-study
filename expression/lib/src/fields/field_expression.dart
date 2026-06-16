import 'package:expression/src/fields/field.dart';
import '../visitor/visitor.dart';

class FieldExpression<T, R> extends Expression {
  final R Function(T) field;
  FieldExpression({required this.field, super.name});

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

class ValueExpression<R> extends Expression {
  final R value;
  ValueExpression({required this.value, super.name});

  @override
  accept(IFieldVisitor visitor, left) {
    return value;
  }
}
