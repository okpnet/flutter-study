import '../../../constants/constants.dart';
import '../../../debugs/debug.dart';
import '../../sort_visitors/sort_visitors.dart';
import '../sort_expressions.dart';

///文字列の名前でアクセスするソート条件の抽象化インターフェイス
abstract interface class ISortNameFieldExpression
    implements ISortExpression, ISortDirectionExpression {
  String get value;
}

///文字列の名前でアクセスするソート条件の抽象化クラス
class SortNameFieldExpression extends SortExpression
    implements ISortNameFieldExpression {
  ///フィールドへのアクセサ
  @override
  final String value;

  ///降順のときTrue
  @override
  final bool isDesc;

  ///コンストラクタ
  SortNameFieldExpression(this.value, {super.name, bool? isDesc})
    : isDesc = isDesc ?? false;

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(ISortVisitor visitor) {
    try {
      return visitor.nameFieldVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug({int? level}) {
    final typeName = value.runtimeType.toString();
    final namePrint = name == null ? 'SORT_NAME_FIELD' : '$name';
    final debugPrint = '$namePrint ($typeName $value)';
    final resultNode = DebugNode(debugPrint);
    return resultNode;
  }
}
