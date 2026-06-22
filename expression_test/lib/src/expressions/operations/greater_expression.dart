import '../../constants/constants.dart';
import '../../extensions/extensions.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///左を基準に右を評価する式
abstract interface class IGreateExpression
    implements IExpression, IOperatorExpression {
  bool get isEqulity;
}

///左を基準に右を評価する式
class GreaterExpression extends OperatorExpression
    implements IGreateExpression {
  ///True:~以上にする
  @override
  final bool isEqulity;

  GreaterExpression(super.left, super.right, {bool? isEqulity, super.name})
    : isEqulity = isEqulity ?? false;

  @override
  ExpresionCallBack accept(IVisitor visitor) {
    return visitor.greaterVisit(this);
  }

  @override
  DebugNode acceptDebug({int? level}) {
    final debugPrint = '>${isEqulity ? "=" : ""} [${name ?? "no_name"}]';
    final resultNode = DebugNode(debugPrint, [
      left.acceptDebug(),
      right.acceptDebug(),
    ]);
    return resultNode;
  }
}
