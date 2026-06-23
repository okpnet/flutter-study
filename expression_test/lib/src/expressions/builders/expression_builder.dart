// ignore_for_file: unnecessary_cast

import 'package:expression_test/expression_test.dart';

///Expressionから式を構築する
final class ExpressionBuilder {
  static R Function(T) build<T, R>(Expression expression, Visitor<T> visitor) {
    final func = expression.accept(visitor);
    return (T t) {
      final result = func(t);
      if (result is! R) {
        throw AssertionError(
          'The ${func.toString()} result obtained from constructing ${expression.name ?? expression.toString()} cannot be cast to type R:${R.toString()}, because it was of type${result.toString()}.',
        );
      }
      return result as R;
    };
  }

  ///Expressionから式を構築するときの、型、式の組合わせの情報を文字列に変換してデバッグをサポートする
  ///不可逆であり、文字列からExpressionの復元はできない
  static String buildDebug<T>(Expression expresison) {
    final bufferNode = expresison.acceptDebug();
    final buffer = _formatDebug(bufferNode);
    final typeStr = T.toString();
    final result = '( $typeStr )=>\n$buffer';
    return result;
  }

  ///Expressionをデバック用のノードを展開する
  static String _formatDebug(DebugNode node, [int level = 0]) {
    final indent = '  ' * level;
    final buffer = StringBuffer('$indent${node.debugPrint}\n');
    for (final child in node.children) {
      buffer.write(_formatDebug(child, level + 1));
    }
    return buffer.toString();
  }
}
