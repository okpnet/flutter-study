import '../../../constants/constants.dart';
import '../../../debugs/debug.dart';
import '../../sort_visitors/sort_visitors.dart';
import '../sort_expressions.dart';

abstract interface class ISortListExpression implements ISortExpression {
  List<ISortDirectionExpression> get sortOrderList;
}

class SortListExpression extends SortExpression implements ISortListExpression {
  ///フィールドへのアクセサ
  @override
  final List<ISortDirectionExpression> sortOrderList;

  ///コンストラクタ
  SortListExpression({required this.sortOrderList, super.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(ISortVisitor visitor) {
    try {
      return visitor.sortListVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug({int? level}) {
    final debugPrint = 'SORT_LIST [${name ?? "no_name"}]';
    final resultNoed = DebugNode(
      debugPrint,
      sortOrderList
          .whereType<ISortExpression>()
          .map((t) => t.acceptDebug())
          .toList(),
    );
    return resultNoed;
  }
}
