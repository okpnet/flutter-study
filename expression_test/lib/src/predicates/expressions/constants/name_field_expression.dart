import '../../../constants/constants.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///値
abstract interface class INameFieldExpression implements IValueExpression {}

///値
class NameFieldExpression extends Expression implements INameFieldExpression {
  ///フィールドへのアクセサ
  @override
  final String value;

  ///コンストラクタ
  NameFieldExpression(this.value, {super.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(IVisitor visitor) {
    try {
      return visitor.nameFieldVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug({int? level}) {
    final typeName = value.runtimeType.toString();
    final namePrint = name == null ? 'NAME_FIELD' : '$name';
    final debugPrint = '$namePrint ($typeName $value)';
    final resultNode = DebugNode(debugPrint);
    return resultNode;
  }
}
