import '../constants/constants.dart';
import '../expressions/expressions.dart';
import 'visitors.dart';

abstract interface class IGraphqlVisitor<T> implements IVisitor<T> {}

///Expressionを巡回して、各Expressionに応じたGraphQLの条件式に変換する
class GraphqlVisitor<T> extends Visitor<T>
    with VisitorMixin
    implements ISqlVisitor<T> {
  @override
  ExpresionCallBack andVisit(AndExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return {
          '_and': [lValue, rValue],
        };
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack endWithVisit(EndWithExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t).toString();
        final rValue = r(t).toString();
        return {
          lValue: {ex.isNot ? '_nlike' : '_like': '%$rValue'},
        };
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack equalVisit(EquqleExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t).toString();
        final rValue = r(t);
        return {
          lValue: {'_eq': rValue},
        };
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
      typeValidation(ex, t);
      try {
        // ignore: unnecessary_cast
        final argment = t as T; //変換しないと例外が発生する
        final filed = ex.field(argment).toString();
        return filed;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack greaterVisit(GreaterExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t).toString();
        final rValue = r(t);
        return {
          lValue: {ex.isEqulity ? '_gte' : '_gt': rValue},
        };
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack inVisit(InExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t).toString();
        final rValue = r(t);
        if (rValue case List list) {
          return {
            lValue: {ex.isNot ? '_nin' : '_in': list},
          };
        }
        throw AssertionError(
          'Result value type of ${ex.name ?? ex.toString()} is ${rValue.toString()},but right value on InExpression shall List type.',
        );
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack likeVisit(LikeExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t).toString();
        final rValue = r(t).toString();
        return {
          lValue: {ex.isNot ? '_nlike' : '_like': '%$rValue%'},
        };
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack orVisit(OrExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return {
          '_or': [lValue, rValue],
        };
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack startWithVisit(StartWithExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t).toString();
        final rValue = r(t).toString();
        return {
          lValue: {ex.isNot ? '_nlike' : '_like': '$rValue%'},
        };
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
