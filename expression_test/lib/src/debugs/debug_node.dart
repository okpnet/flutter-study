class DebugNode {
  final String debugPrint;
  final List<DebugNode> children;

  DebugNode(this.debugPrint, [this.children = const []]);

  String formatDebug([int level = 0]) {
    return _formatDebug(this, level);
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
