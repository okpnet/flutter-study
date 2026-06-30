import '../constants/constants.dart';
import 'debugs.dart';

///Expressionの抽象化インターフェース。
abstract interface class IExpressionDebug {
  ///デバッグ用のこのインスタンスの文字列を返す
  DebugNode acceptDebug();

  ///[accept]を実行したときに発生する例外をExpresionErrorに変換して振り出す
  ///[error]発生基のError
  ExpressionError acceptAssertion(Error error);
}

abstract interface class ISortExpressionDebug {
  ///デバッグ用のこのインスタンスの文字列を返す
  DebugNode acceptDebug();

  ///[accept]を実行したときに発生する例外をExpresionErrorに変換して振り出す
  ///[error]発生基のError
  SortExpressionError acceptAssertion(Error error);
}
