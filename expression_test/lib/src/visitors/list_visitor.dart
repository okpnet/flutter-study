import 'package:expression_test/expression_test.dart';

abstract interface class IListVisitor {}

class ListVisitor<T> extends Visitor<T> {
  @override
  ExpresionCallBack andVisit(OperatorExpression ex) {
    return (dynamic t) {
      if (t is! T) {
        throw AssertionError(
          'The argument to ${ex.name ?? ex.toString()} is specified as type ${T.toString()}, but the given value is of type ${t.toString()}. is ',
        );
      }
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return lValue && rValue;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack equalVisit(OperatorExpression ex) {
    return (dynamic t) {
      if (t is! T) {
        throw AssertionError(
          'The argument to ${ex.name ?? ex.toString()} is specified as type ${T.toString()}, but the given value is of type ${t.toString()}. is ',
        );
      }
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return lValue == rValue;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack fieldVisit(FieldExpression<T> ex) {
    return (dynamic t) {
      if (t is! T) {
        throw AssertionError(
          'The argument to ${ex.name ?? ex.toString()} is specified as type ${T.toString()}, but the given value is of type ${t.toString()}. is ',
        );
      }
      try {
        final argment = t as T;
        final filed = ex.field(argment);
        return filed;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack greaterVisit(OperatorExpression ex) {
    return (dynamic t) {
      if (t is! T) {
        throw AssertionError(
          'The argument to ${ex.name ?? ex.toString()} is specified as type ${T.toString()}, but the given value is of type ${t.toString()}. is ',
        );
      }
      try {
        final expression = ex as GreaterExpression;
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return expression.isEqulity ? lValue >= rValue : lValue > rValue;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack valueVisit(ValueExpression ex) {
    return (dynamic t) {
      try {
        final value = ex.value;
        return value;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }
}
