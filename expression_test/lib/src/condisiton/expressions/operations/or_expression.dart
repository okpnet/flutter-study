import '../../../constants/constant.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///左を基準に右を結合する式
abstract interface class IOrExpression
    implements IExpression, IOperatorExpression {}

///左を基準に右を結合する式
class OrExpression extends OperatorExpression implements IOrExpression {
  OrExpression(super.left, super.right, {super.name});

  @override
  ExpresionCallBack accept(IVisitor visitor) {
    try {
      return visitor.orVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug() {
    final debugPrint = 'OR [${name ?? "no_name"}]';
    final resultNode = DebugNode(debugPrint, [
      left.acceptDebug(),
      right.acceptDebug(),
    ]);
    return resultNode;
  }
}
