import '../../constants/constants.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

abstract interface class IGreateExpression
    implements IExpression, IOperatorExpression {
  bool get isEqulity;
}

class GreaterExpression extends OperatorExpression
    implements IGreateExpression {
  @override
  final bool isEqulity;

  GreaterExpression(super.left, super.right, {bool? isEqulity})
    : isEqulity = isEqulity ?? false;

  @override
  ExpresionCallBack accept(IVisitor visitor) {
    return visitor.equalVisit(this);
  }

  @override
  String acceptDebug(IVisitor visitor, int level) {
    final l = left.accept(visitor).toString();
    final r = right.accept(visitor).toString();
    final result = "$l ${!isEqulity ? '>' : '>='} $r";
    return result;
  }
}
