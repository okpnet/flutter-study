import '../../constants/constants.dart';
import '../../debugs/debug.dart';
import '../sort_visitors/sort_visitors.dart';

abstract interface class ISortExpression {
  ///このExpresionの識別名。フィールドや値として使用してはいけない。
  String? get name;

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  ExpresionCallBack accept(ISortVisitor visitor);

  ///デバッグ用のこのインスタンスの文字列を返す
  DebugNode acceptDebug();

  ///[accept]を実行したときに発生する例外をExpresionErrorに変換して振り出す
  ///[error]発生基のError
  SortExpressionError acceptAssertion(Error error);
}

abstract class SortExpression implements ISortExpression {
  ///このExpresionの識別名。フィールドや値として使用してはいけない。
  @override
  final String? name;

  ///コンストラクタ
  SortExpression({this.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  ExpresionCallBack accept(ISortVisitor visitor);

  ///デバッグ用のこのインスタンスの文字列を返す
  ///[visitor]訪問者
  ///[level]このノードの深さ。インデント数。
  @override
  DebugNode acceptDebug();

  ///[accept]を実行したときに発生する例外をExpresionErrorに変換して振り出す
  ///[error]発生基のError
  @override
  SortExpressionError acceptAssertion(Error error) {
    return SortExpressionError(this, error);
  }
}
