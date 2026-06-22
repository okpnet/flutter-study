import 'package:expression_test/expression_test.dart';

class ExpressionBuilder {
  R Function(T) build<T, R>(Expression expression, Visitor<T> visitor) {
    final result = expression.accept(visitor);
    // if (result is! R Function(T)) {
    //   AssertionError();
    // }
    return (T t) => result(t) as R;
  }

  String buildDebug<T>(Expression expresison) {
    final bufferNode = expresison.acceptDebug();
    final buffer = _formatDebug(bufferNode);
    final typeStr = T.toString();
    final result = '( $typeStr )=>\n$buffer';
    return result;
  }

  String _formatDebug(DebugNode node, [int level = 0]) {
    final indent = '  ' * level;
    final buffer = StringBuffer('$indent${node.debugPrint}\n');
    for (final child in node.children) {
      buffer.write(_formatDebug(child, level + 1));
    }
    return buffer.toString();
  }
}
