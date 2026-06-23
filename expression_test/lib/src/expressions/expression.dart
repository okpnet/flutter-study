import '../constants/constants.dart';
import '../visitors/visitors.dart';
import 'debugs/debug.dart';

///Expressionの抽象化インターフェース。
abstract interface class IExpression {
  ///このExpresionの識別名。フィールドや値として使用してはいけない。
  String? get name;

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  ExpresionCallBack accept(IVisitor visitor);

  ///デバッグ用のこのインスタンスの文字列を返す
  DebugNode acceptDebug();

  ///[accept]を実行したときに発生する例外をExpresionErrorに変換して振り出す
  ///[error]発生基のError
  ExpressionError acceptAssertion(Error error);
}

///基本となるExpressionのひな形
abstract class Expression implements IExpression {
  ///このExpresionの識別名。フィールドや値として使用してはいけない。
  @override
  final String? name;

  ///コンストラクタ
  Expression({this.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(IVisitor visitor);

  ///デバッグ用のこのインスタンスの文字列を返す
  ///[visitor]訪問者
  ///[level]このノードの深さ。インデント数。
  @override
  DebugNode acceptDebug();

  ///[accept]を実行したときに発生する例外をExpresionErrorに変換して振り出す
  ///[error]発生基のError
  @override
  ExpressionError acceptAssertion(Error error) {
    return ExpressionError(this, error);
  }
}
