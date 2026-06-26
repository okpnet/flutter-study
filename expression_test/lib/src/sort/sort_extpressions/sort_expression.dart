import '../../constants/constants.dart';
import '../../debugs/debug.dart';
import '../sort_visitors/sort_visitors.dart';

///ソート条件の抽象化インターフェイス
abstract interface class ISortExpression {
  ///このExpresionの識別名。フィールドや値として使用してはいけない。
  String? get name;

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  dynamic accept(ISortVisitor visitor);

  ///デバッグ用のこのインスタンスの文字列を返す
  DebugNode acceptDebug();

  ///[accept]を実行したときに発生する例外をExpresionErrorに変換して振り出す
  ///[error]発生基のError
  SortExpressionError acceptAssertion(Error error);
}

///ソート方向をもつ抽象化インターフェイス
abstract interface class ISortDirectionExpression {
  ///降順のとき[true]
  bool get isDesc;
}

///ソート条件の抽象化クラス
abstract class SortExpression implements ISortExpression {
  ///このExpresionの識別名。フィールドや値として使用してはいけない。
  @override
  final String? name;

  ///コンストラクタ
  SortExpression({this.name});

  ///Visitorが巡回にきたときの処置。
  ///中でVisitorがこのインスタンスを使ってデリゲートを返す
  @override
  dynamic accept(ISortVisitor visitor);

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
