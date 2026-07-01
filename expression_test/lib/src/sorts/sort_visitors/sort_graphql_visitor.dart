import 'package:expression_test/src/constants/constant.dart';

import '../sort_extpressions/sort_expressions.dart';
import 'sort_visitors.dart';

///空のインターフェイス
abstract interface class ISortGraphQLVisitor {}

///SortExpresssionを巡回してGraphQLのソート条件に変換する
class SortGraphQLVisitor<T> extends SortVisitor<T, MapCallBack>
    with SortVisitorMixin
    implements ISortVisitor<T>, ISortGraphQLVisitor {
  /// フィールド式（ラムダでフィールドを取得するケース）
  @override
  MapCallBack<T> fieldVisit(SortFieldExpression<T> ex) {
    return (T t) => {
      ex.field(t).toString(): ex.isDesc
          ? SORT_DESC.toLowerCase()
          : SORT_ASC.toLowerCase(),
    };
  }

  /// フィールド名を直接指定するケース
  @override
  MapCallBack<T> nameFieldVisit(SortNameFieldExpression ex) {
    return (T t) => {
      ex.value: ex.isDesc ? SORT_DESC.toLowerCase() : SORT_ASC.toLowerCase(),
    };
  }

  /// 複数ソートの結合
  @override
  MapCallBack<T> sortListVisit(SortListExpression ex) {
    final result = <String, dynamic>{};
    return (T t) {
      for (final sortExp in ex.sortOrderList) {
        final map = (sortExp as SortExpression).accept(this)(t);
        result.addAll(map); // Map をマージ
      }
      return result;
    };
  }
}
