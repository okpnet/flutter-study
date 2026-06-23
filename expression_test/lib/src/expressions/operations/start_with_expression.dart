import '../../constants/constant.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///左を基準に右を結合する式
abstract interface class IStartWithExpression
    implements IExpression, IOperatorExpression {
  bool get isNot;
}

///左を基準に右を結合する式
class StartWithExpression extends OperatorExpression
    implements IStartWithExpression {
  ///否定
  @override
  final bool isNot;

  StartWithExpression(super.left, super.right, {super.name, bool? isNot})
    : isNot = isNot ?? false;

  @override
  ExpresionCallBack accept(IVisitor visitor) {
    try {
      return visitor.startWithVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug() {
    final debugPrint = 'START_WITH [${name ?? "no_name"}]';
    final resultNode = DebugNode(debugPrint, [
      left.acceptDebug(),
      right.acceptDebug(),
    ]);
    return resultNode;
  }
}
