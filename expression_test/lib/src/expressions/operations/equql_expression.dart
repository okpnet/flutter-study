import '../../constants/constants.dart';
import '../../visitors/visitors.dart';
import '../expressions.dart';

abstract interface class IEquqlExpression
    implements IExpression, IOperatorExpression {
  bool get isNot;
}

class EquqleExpression extends OperatorExpression implements IEquqlExpression {
  @override
  final bool isNot;

  EquqleExpression(super.left, super.right, {bool? isNot})
    : isNot = isNot ?? false;

  @override
  ExpresionCallBack accept(IVisitor visitor) {
    return visitor.equalVisit(this);
  }

  @override
  String acceptDebug(IVisitor visitor, int level) {
    final l = left.accept(visitor).toString();
    final r = right.accept(visitor).toString();
    final result = "$l ${!isNot ? '=' : '!='} $r";
    return result;
  }
}
