import 'package:expression_test/src/constants/constant.dart';
import 'package:expression_test/src/expressions/constants/field_expression.dart';
import 'package:expression_test/src/expressions/constants/value_expression.dart';
import 'package:expression_test/src/expressions/operations/operator_expression.dart';
import 'package:expression_test/src/visitors/visitor.dart';

abstract interface class IListVisitor {}

class ListVisitor<T> extends Visitor {
  @override
  ExpresionCallBack andVisit(OperatorExpression ex) {
    // TODO: implement andVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack equalVisit(OperatorExpression ex) {
    return (dynamic t) {
      if (t is! T) {
        AssertionError(ex);
      }
      return ex.field(t);
    };
  }

  @override
  ExpresionCallBack fieldVisit(FieldExpression<dynamic> ex) {
    return (dynamic t) {
      if (t is! T) {
        AssertionError(ex);
      }
      return ex.field(t);
    };
  }

  @override
  ExpresionCallBack greaterVisit(OperatorExpression ex) {
    // TODO: implement greaterVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack valueVisit(ValueExpression ex) {
    return (dynamic t) {
      if (t is! T) {
        AssertionError(ex);
      }
      return ex.value;
    };
  }
}
