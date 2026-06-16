import 'package:expression/src/fields/field.dart';

abstract interface class IFieldVisitor {}

///Expressionツリーを循環して[T]を受け取りExpressionの[accept]を実行して[R]に変換します。
abstract class FieldVisitor implements IFieldVisitor {
  //&Expressionを
  R Function(T) andExpression<T,R>(R Function(T) left, R Function(T) right);
  R Function(T) orExpression<T,R>(R Function(T) left, R Function(T) right);
  bool Function(T) onStartWith<T,R>(String left, String right);

  R Function(T) eval<T,R>(Expression ex) {
    return switch (ex) {
      FieldExpression<T, R> arg => fieldeEvalute(arg.field),
      ValueExpression<R> arg => valueEvalute(arg.value),
      AndExpressison arg => andEvalute(arg.left, arg.right),
      OrExpressison arg => andEvalute(arg.left, arg.right),
      StartWithExpression arg=>onStartWith(left, right)
      _ => throw UnimplementedError('Expression not implement type '),
    };
  }

  R Function(T) fieldeEvalute<T,R>(R Function(T) func) => func;
  R Function(T) valueEvalute<T,R>(R value) =>
      (T val) => value;
  R Function(T) andEvalute<T,R>(Expression left, Expression right) {
    final l = eval(left);
    final r = eval(right);
    return andExpression(l, r);
  }

  R Function(T) orEvalute<T,R>(Expression left, Expression right) {
    final l = eval(left);
    final r = eval(right);
    return orExpression(l, r);
  }

  bool Function(T) orStartWith<T>(Expression left, Expression right) {
    final l = eval(left);
    final r = eval(right);
    return onStartWith(l(val).toString(), r(val).toString());
  }

  bool Function(dynamic) operator(
    bool Function(dynamic, dynamic) delegate,
    Expression left,
    Expression right,
  ) {
    final l = eval(left);
    final r = eval(right);
    return (dynamic val) => delegate(l(val), r(val));
  }
}
