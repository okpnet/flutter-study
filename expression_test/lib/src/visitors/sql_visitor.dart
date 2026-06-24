import '../constants/constants.dart';
import '../expressions/expressions.dart';
import 'visitors.dart';

abstract interface class ISqlVisitor<T> implements IVisitor<T> {}

///Expressionを巡回して、各Expressionに応じたSQLの条件式に変換する
class SqlVisitor<T> extends Visitor<T>
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
        return "($lValue AND $rValue)";
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
        final lValue = l(t);
        final rValue = r(t);
        final not = ex.isNot ? ' NOT ' : '';
        return "$lValue $not LIKE '%$rValue'";
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
        final lValue = l(t);
        final rValue = r(t);
        return "$lValue = $rValue";
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
        final lValue = l(t);
        final rValue = r(t);
        final eq = ex.isEqulity ? '=' : '';
        return "$lValue >$eq $rValue";
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
        final lValue = l(t);
        final rValue = r(t);
        final values = changeType(rValue);
        return "$lValue IN ($values)";
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
        final lValue = l(t);
        final rValue = r(t);
        final not = ex.isNot ? ' NOT ' : '';
        return "$lValue $not LIKE '%$rValue%'";
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
        return "($lValue OR $rValue)";
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
        final lValue = l(t);
        final rValue = r(t);
        final not = ex.isNot ? ' NOT ' : '';
        return "$lValue $not LIKE '$rValue%'";
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
        return changeType(value);
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  String changeType(dynamic value) {
    return switch (value) {
      num num => num.toString(),
      List list => list.map((t) => changeType(t)).join(','),
      _ => "'$value'",
    };
  }
}
