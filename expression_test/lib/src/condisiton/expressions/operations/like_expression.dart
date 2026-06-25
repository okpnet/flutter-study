import '../../../constants/constant.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///左を基準に右を結合する式
abstract interface class ILikeExpression
    implements IExpression, IOperatorExpression {
  bool get isNot;
}

///左を基準に右を結合する式
class LikeExpression extends OperatorExpression implements ILikeExpression {
  ///否定
  @override
  final bool isNot;

  LikeExpression(super.left, super.right, {super.name, bool? isNot})
    : isNot = isNot ?? false;

  @override
  ExpresionCallBack accept(IVisitor visitor) {
    try {
      return visitor.likeVisit(this);
    } catch (ex) {
      throw acceptAssertion(ex as Error);
    }
  }

  @override
  DebugNode acceptDebug() {
    final debugPrint = 'LIKE [${name ?? "no_name"}]';
    final resultNode = DebugNode(debugPrint, [
      left.acceptDebug(),
      right.acceptDebug(),
    ]);
    return resultNode;
  }
}
