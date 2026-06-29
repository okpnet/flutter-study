import '../sort_extpressions/sort_expressions.dart';
import 'sort_visitors.dart';

typedef SqlCallBack = String Function(dynamic);

abstract interface class ISortSqlVisitor {}

class SortSqlVisitor<T> extends SortVisitor<T, String>
    with SortVisitorMixin
    implements ISortVisitor<T>, ISortSqlVisitor {
  @override
  SqlCallBack fieldVisit(SortFieldExpression<T> ex) {
    // ignore: prefer_function_declarations_over_variables
    return (dynamic value) {
      try {
        final sortField = ex.field(value as T).toString();
        return !ex.isDesc ? '$sortField ASC' : '$sortField DESC';
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  SqlCallBack nameFieldVisit(SortNameFieldExpression ex) {
    return (dynamic value) {
      try {
        return !ex.isDesc ? '${ex.value} ASC' : '${ex.value} DESC';
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  SqlCallBack sortListVisit(SortListExpression ex) {
    return (dynamic val) {
      final sortList = ex.sortOrderList
          .map((t) => (t as SortExpression).accept(this)(t) as String)
          .toList();
      return sortList.join(',');
    };
  }
}
