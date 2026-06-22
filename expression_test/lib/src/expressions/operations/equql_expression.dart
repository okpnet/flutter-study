import '../../constants/constants.dart';
import '../../extensions/extensions.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

///左を基準に右を評価する式
abstract interface class IEquqlExpression
    implements IExpression, IOperatorExpression {
  bool get isNot;
}

///左を基準に右を評価する式
class EquqleExpression extends OperatorExpression implements IEquqlExpression {
  ///True:否定
  @override
  final bool isNot;

  EquqleExpression(super.left, super.right, {bool? isNot, super.name})
    : isNot = isNot ?? false;

  @override
  ExpresionCallBack accept(IVisitor visitor) {
    return visitor.equalVisit(this);
  }

  @override
  DebugNode acceptDebug() {
    final debugPrint = '= [${name ?? "no_name"}]';
    final resultNode = DebugNode(debugPrint, [
      left.acceptDebug(),
      right.acceptDebug(),
    ]);
    return resultNode;
  }
}
