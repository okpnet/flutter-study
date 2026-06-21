import '../../constants/constants.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

abstract interface class IFieldExpression implements IExpression {
  ExpresionCallBack get field;
}

///クラスのプロパティ、文字列など比較フィールド
class FieldExpression extends Expression implements IFieldExpression {
  ///フィールドへのアクセサ
  @override
  final ExpresionCallBack field;

  ///コンストラクタ
  FieldExpression(this.field, {super.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(IVisitor visitor) {
    return visitor.fieldVisit(this);
  }
}
