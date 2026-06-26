import '../sort_extpressions/sort_expressions.dart';
import 'sort_visitors.dart';

typedef ListCallBack = int Function(dynamic, dynamic);
typedef InnerListCallBack<T> = int Function(T, T);

abstract interface class ISortListVisitor {}

class SortListVisitor<T> extends SortVisitor<T, ListCallBack>
    with SortVisitorMixin
    implements ISortVisitor<T>, ISortListVisitor {
  @override
  ListCallBack fieldVisit(SortFieldExpression<T> ex) {
    // ignore: prefer_function_declarations_over_variables
    return (dynamic left, dynamic right) {
      typeValidation(ex, left);
      typeValidation(ex, right);
      try {
        final l = ex.field(left as T) as Comparable;
        final r = ex.field(right as T) as Comparable;
        return !ex.isDesc ? l.compareTo(r) : r.compareTo(l);
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ListCallBack nameFieldVisit(SortNameFieldExpression ex) {
    throw UnsupportedError(
      'The ${ex.name ?? ex.toString()} cannot be used for a function that has arguments of unknown type.',
    );
  }

  @override
  ListCallBack sortListVisit(SortListExpression ex) {
    return (dynamic left, dynamic right) {
      int compare = 0;
      for (var expression in ex.sortOrderList) {
        final func =
            (expression as SortExpression).accept(this) as ListCallBack;
        compare = func(left, right);
        if (compare != 0) {
          return compare;
        }
      }
      return compare;
    };
  }
}
