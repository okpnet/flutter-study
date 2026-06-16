import '../fields/field.dart';
import '../visitor/visitor.dart';

class FieldConvertter {
  final FieldVisitor fieldVisitor;

  FieldConvertter({required this.fieldVisitor});

  R evalute<T, R>(Expression expression) {
    dynamic result;
    (T val) {
      result = expression.accept(fieldVisitor, val);
    };
    return result;
  }
}
