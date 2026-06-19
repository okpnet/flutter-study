import '../../../expression.dart';

class SqlVisitor extends FieldVisitor {
  // AND
  @override
  R Function(T) visitAnd<T, R>(AndExpression<T, R> ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);
    return (dynamic t) => "(${l(t)} AND ${r(t)})" as R;
  }

  // OR
  @override
  R Function(T) visitOr<T, R>(OrExpression<T, R> ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);
    return (T? _) => "(${l(null)} OR ${r(null)})" as R;
  }

  // Field
  @override
  R Function(T) visitField<T, R>(FieldExpression<T, R> ex) {
    return (t) => (ex.field(t) ?? "<field>") as R;
  }

  // Value
  @override
  R Function(T) visitValue<T, R>(ValueExpression<R> ex) {
    return (_) {
      final v = ex.value;
      if (v is String) return "'$v'" as R;
      if (v is Iterable) return v.join(",") as R;
      return v;
    };
  }

  // Operator (=, <, >, <=, >=, LIKE, STARTS_WITH)
  @override
  R Function(dynamic) visitOperator<T, R>(OperatorExpression<T, R> ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);

    return (dynamic t) {
      final lv = l(t);
      final rv = r(t);

      if (ex.lable == "STARTS_WITH") {
        return "$lv LIKE '${rv.replaceAll("'", "")}%'" as R;
      }

      if (ex.lable == "LIKE") {
        return "$lv LIKE $rv" as R;
      }

      return "$lv ${ex.lable} $rv" as R;
    };
  }

  // IN
  @override
  R Function(T) visitIn<T, R>(InExpression<R> ex) {
    final v = ex.value.accept(this);
    final lst = ex.list.accept(this);

    return (t) => "${v(t)} IN (${lst(t)})" as R;
  }

  // BETWEEN
  @override
  R Function(T) visitBetween<T, V, R>(BetweenExpression<T, V, R> ex) {
    final v = ex.value.accept(this);
    final min = ex.min.accept(this);
    final max = ex.max.accept(this);

    return (T t) => "${v(t)} BETWEEN ${min(t)} AND ${max(t)}" as R;
  }
}
