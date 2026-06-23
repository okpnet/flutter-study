import 'package:expression_test/expression_test.dart';

///空のインターフェイス
abstract interface class IListVisitor {}

///Expressionを巡回して、各Expressionに応じたListの条件式に変換する
class ListVisitor<T> extends Visitor<T>
    with VisitorMixin
    implements IListVisitor {
  ///ANDの処理。通常の&で結合
  @override
  ExpresionCallBack andVisit(AndExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return lValue & rValue;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  ///=
  @override
  ExpresionCallBack equalVisit(EquqleExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
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

  ///インスタンスの値を抽出する
  @override
  ExpresionCallBack fieldVisit(FieldExpression<T> ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        // ignore: unnecessary_cast
        final argment = t as T; //変換しないと例外が発生する
        final filed = ex.field(argment);
        return filed;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  ///以上
  @override
  ExpresionCallBack greaterVisit(GreaterExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return ex.isEqulity ? lValue >= rValue : lValue > rValue;
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  ///コンスタント値
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

  @override
  ExpresionCallBack orVisit(OrExpression ex) {
    return (dynamic t) {
      typeValidation(ex, t);
      try {
        final l = ex.left.accept(this);
        final r = ex.right.accept(this);
        final lValue = l(t);
        final rValue = r(t);
        return lValue | rValue;
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
        return ex.isNot
            ? !lValue.toString().contains(rValue.toString())
            : lValue.toString().contains(rValue.toString());
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
        return ex.isNot
            ? !lValue.toString().startsWith(rValue.toString())
            : lValue.toString().startsWith(rValue.toString());
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
        return ex.isNot
            ? !lValue.toString().endsWith(rValue.toString())
            : lValue.toString().endsWith(rValue.toString());
      } catch (exception, trace) {
        throw AssertionError(
          '${ex.name ?? ex.toString()} : ${exception.toString()}\n$trace',
        );
      }
    };
  }

  @override
  ExpresionCallBack inVisit(InExpression ex) {
    throw UnimplementedError('List in method is ');
  }
}
