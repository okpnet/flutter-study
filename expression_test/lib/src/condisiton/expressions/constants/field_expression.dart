import '../../constants/constants.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

abstract interface class IFieldExpression<T> implements IExpression {
  ValueCallBack<T> get field;
}

///クラスのプロパティ、文字列など比較フィールド
class FieldExpression<T> extends Expression implements IFieldExpression<T> {
  ///フィールドへのアクセサ
  @override
  final ValueCallBack<T> field;

  ///コンストラクタ
  FieldExpression(this.field, {super.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(IVisitor visitor) {
    try {
      return visitor.fieldVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug({int? level}) {
    final fieldStr = field.toString().replaceAll(RegExp('Closure: '), '');
    final namePrint = name == null ? 'FIELD' : '$name';
    final debugPrint = '$namePrint $fieldStr';
    final resultNode = DebugNode(debugPrint);
    return resultNode;
  }
}
