import '../../constants/constants.dart';
import '../expressions/expressions.dart';

///Expressionの巡回する抽象化インターフェイス
abstract interface class IVisitor<T> {
  ///(T)=>dynamic
  ExpresionCallBack fieldVisit(FieldExpression<T> ex);

  /// dynamic
  ExpresionCallBack valueVisit(ValueExpression ex);

  /// left = right | left != right
  ExpresionCallBack equalVisit(EquqleExpression ex);

  /// &  AND
  ExpresionCallBack andVisit(AndExpression ex);

  /// left > right | left>= light
  ExpresionCallBack greaterVisit(GreaterExpression ex);

  /// | or
  ExpresionCallBack orVisit(OrExpression ex);

  /// {!}left.contains(right) | left {NOT} LIKE %right%
  ExpresionCallBack likeVisit(LikeExpression ex);

  /// {!}left.startwith(right) | left {NOT} LIKE 'right%'
  ExpresionCallBack startWithVisit(StartWithExpression ex);

  /// {!}left.startwith(right) | left {NOT} LIKE '%right'
  ExpresionCallBack endWithVisit(EndWithExpression ex);

  // {!}right.contains(right) | left {NOT} IN (right)
  ExpresionCallBack inVisit(InExpression ex);

  // String
  ExpresionCallBack nameFieldVisit(NameFieldExpression ex);
}

///Expressionを巡回する抽象化クラス
abstract class Visitor<T> implements IVisitor<T> {}
