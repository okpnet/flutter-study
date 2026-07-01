import '../expressions.dart';

///左を基準に右を評価する式
abstract interface class IOperatorExpression implements IExpression {
  ///左側の式
  Expression get left;

  ///右側の式
  Expression get right;
}

///左を基準に右を評価する式
abstract class OperatorExpression extends Expression
    implements IOperatorExpression {
  ///左側の式
  @override
  final Expression left;

  ///右側の式
  @override
  final Expression right;

  ///コンストラクタ
  OperatorExpression(this.left, this.right, {super.name});
}
