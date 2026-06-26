import '../../../constants/constants.dart';
import '../../../debugs/debug.dart';
import '../../sort_visitors/sort_visitors.dart';
import '../sort_expressions.dart';

///順ソート条件の抽象化インターフェイス
abstract interface class ISortFieldExpression<T>
    implements ISortExpression, ISortDirectionExpression {
  ValueCallBack<T> get field;
}

///順ソート条件の抽象化クラス
class SortFieldExpression<T> extends SortExpression
    implements ISortFieldExpression<T> {
  ///フィールドへのアクセサ
  @override
  final ValueCallBack<T> field;

  ///降順のときTrue
  @override
  final bool isDesc;

  ///コンストラクタ
  SortFieldExpression(this.field, {super.name, bool? isDesc})
    : isDesc = isDesc ?? false;

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(ISortVisitor visitor) {
    try {
      return visitor.fieldVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug({int? level}) {
    final fieldStr = field.toString().replaceAll(RegExp('Closure: '), '');
    final namePrint = name == null ? 'SORT_FIELD' : '$name';
    final debugPrint = '$namePrint $fieldStr';
    final resultNode = DebugNode(debugPrint);
    return resultNode;
  }
}
