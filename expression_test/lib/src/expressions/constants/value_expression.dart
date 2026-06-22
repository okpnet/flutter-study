import '../../constants/constants.dart';
import '../../extensions/extensions.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///値
abstract interface class IValueExpression implements IExpression {
  dynamic get value;
}

///値
class ValueExpression extends Expression implements IValueExpression {
  ///フィールドへのアクセサ
  @override
  final dynamic value;

  ///コンストラクタ
  ValueExpression(this.value, {super.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(IVisitor visitor) {
    return visitor.valueVisit(this);
  }

  @override
  DebugNode acceptDebug({int? level}) {
    final typeName = value.runtimeType.toString();
    final namePrint = name == null ? 'VALUE' : '$name';
    final debugPrint = '$namePrint ($typeName $value)';
    final resultNode = DebugNode(debugPrint);
    return resultNode;
  }
}
