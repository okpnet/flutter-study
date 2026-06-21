import '../constants/constants.dart';
import '../expressions/expressions.dart';

abstract interface class IVisitor {
  ExpresionCallBack fieldVisit(FieldExpression ex);
  ExpresionCallBack valueVisit(ValueExpression ex);
  ExpresionCallBack equalVisit(OperatorExpression ex);
}

abstract class VisitorBase implements IVisitor {}
