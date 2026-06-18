import '../../expression.dart';

class HasuraGraphqlVisitor extends FieldVisitor {
  // AND
  @override
  R Function(T) visitAnd<T, R>(AndExpression ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);

    return (dynamic t) =>
        <String, dynamic>{
              "_and": [l(t), r(t)],
            }
            as R;
  }

  // OR
  @override
  R Function(T) visitOr<T, R>(OrExpression ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);

    return (dynamic t) =>
        <String, dynamic>{
              "_or": [l(t), r(t)],
            }
            as R;
  }

  // Field: ここでは単体では何も返さず「カラム名」として使う
  @override
  R Function(T) visitField<T, R>(FieldExpression<T, R> ex) {
    return (dynamic t) => (ex.field(t) ?? "<field>") as R;
  }

  // Value: Hasura ではそのまま値として使う
  @override
  R Function(T) visitValue<T, R>(ValueExpression ex) {
    return (dynamic _) => ex.value;
  }

  // Operator (=, <>, <, >, <=, >=, LIKE, STARTS_WITH)
  @override
  R Function(T) visitOperator<T, R>(OperatorExpression ex) {
    final l = ex.left.accept(this); // フィールド名 or 値
    final r = ex.right.accept(this); // 値

    return (dynamic t) {
      final field = l(t); // 例: "age"
      final value = r(t);

      final op = switch (ex.lable) {
        "=" => "_eq",
        "<>" => "_neq",
        "<" => "_lt",
        "<=" => "_lte",
        ">" => "_gt",
        ">=" => "_gte",
        "LIKE" => "_like",
        "STARTS_WITH" => "_like",
        "END_WITH" => "_like",
        _ => throw UnimplementedError("op ${ex.lable} not supported"),
      };

      final v = switch (ex.lable) {
        "STARTS_WITH" => "${value.toString()}%",
        "END_WITH" => "%${value.toString()}",
        "LIKE" => "%${value.toString()}%",
        _ => value,
      };
      return <String, dynamic>{
            field: {op: v},
          }
          as R;
    };
  }

  // IN
  @override
  R Function(T) visitIn<T, R>(InExpression ex) {
    final v = ex.value.accept(this); // フィールド名
    final lst = ex.list.accept(this); // List 値

    return (dynamic t) {
      final field = v(t);
      final values = lst(t);
      return <String, dynamic>{
            field: {"_in": values},
          }
          as R;
    };
  }

  // BETWEEN
  @override
  R Function(T) visitBetween<T, R>(BetweenExpression ex) {
    final v = ex.value.accept(this); // フィールド名
    final min = ex.min.accept(this);
    final max = ex.max.accept(this);

    return (dynamic t) {
      final field = v(t);
      final lo = min(t);
      final hi = max(t);
      return <String, dynamic>{
            field: {"_gte": lo, "_lte": hi},
          }
          as R;
    };
  }
}
