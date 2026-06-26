import '../sort_extpressions/sort_expressions.dart';

///ソート条件を巡回する抽象化インターフェイス
abstract interface class ISortVisitor<T> {
  dynamic fieldVisit(SortFieldExpression<T> ex);

  dynamic nameFieldVisit(SortNameFieldExpression ex);

  dynamic sortListVisit(SortListExpression ex);
}

///ソート条件を巡回する抽象化クラス
abstract class SortVisitor<T, R> implements ISortVisitor<T> {}
