class DebugNode {
  final String debugPrint;
  final List<DebugNode> children;

  DebugNode(this.debugPrint, [this.children = const []]);
}
