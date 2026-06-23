import '../constants/constants.dart';
import '../expressions/expressions.dart';
import 'visitors.dart';

abstract interface class ISqlVisitor<T> implements IVisitor<T> {}

class SqlVisitor<T> extends Visitor<T>
    with VisitorMixin
    implements ISqlVisitor<T> {
  @override
  ExpresionCallBack andVisit(AndExpression ex) {
    // TODO: implement andVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack endWithVisit(EndWithExpression ex) {
    // TODO: implement endWithVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack equalVisit(EquqleExpression ex) {
    // TODO: implement equalVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack fieldVisit(FieldExpression<T> ex) {
    // TODO: implement fieldVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack greaterVisit(GreaterExpression ex) {
    // TODO: implement greaterVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack inVisit(InExpression ex) {
    // TODO: implement inVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack likeVisit(LikeExpression ex) {
    // TODO: implement likeVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack orVisit(OrExpression ex) {
    // TODO: implement orVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack startWithVisit(StartWithExpression ex) {
    // TODO: implement startWithVisit
    throw UnimplementedError();
  }

  @override
  ExpresionCallBack valueVisit(ValueExpression ex) {
    // TODO: implement valueVisit
    throw UnimplementedError();
  }
}
