import 'debugs.dart';

extension DebugExtension on IExpressionDebug {
  ///Expressionから式を構築するときの、型、式の組合わせの情報を文字列に変換してデバッグをサポートする
  ///不可逆であり、文字列からExpressionの復元はできない
  String buildDebug<T>() {
    final buffer = acceptDebug().formatDebug();
    final typeStr = T.toString();
    final result = '( $typeStr )=>\n$buffer';
    return result;
  }
}
