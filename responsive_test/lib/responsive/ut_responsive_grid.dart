import 'package:flutter/material.dart';
import 'package:responsive_test/responsive/ut_list_extension.dart';
import 'package:responsive_test/responsive/ut_media_breakpoint.dart';
import 'package:responsive_test/responsive/ut_responsive_flex.dart';

class UtResponsiveGrid extends StatelessWidget {
  static const double minWidth = 99;
  final double? flexMinWidth;
  final List<UtResponsiveFlex> children;
  final int maxFlex;
  const UtResponsiveGrid({
    super.key,
    this.flexMinWidth,
    required this.children,
    this.maxFlex = 12,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widgetWidth = constraints.widthConstraints().maxWidth;
        final width = flexMinWidth ?? minWidth;

        final type = UtMediaBreakpoint.of(widgetWidth);
        //ブレークポイント付の有効な子の
        final activeChildren = children
            .where((t) => t.hidePoint == null || type.isVisibleAt(t.hidePoint!))
            .splitWhere((t) => t.cr);
        return Column(
          children: [
            for (var rows in activeChildren)
              for (var row in _row(rows)) _buildRow(row),
          ],
        );
      },
    );
  }

  Widget _buildRow(List<UtResponsiveFlex> list) {
    return Row(children: [for (var value in list) Expanded(child: value)]);
  }

  List<List<UtResponsiveFlex>> _row(
    List<UtResponsiveFlex> values,
    int rowFlexCount,
  ) {
    final rows = <List<UtResponsiveFlex>>[];
    var current = <UtResponsiveFlex>[];
    var sum = 0;

    void flush() {
      final used = current.fold(0, (a, b) => a + b.flex);
      final shortage = rowFlexCount - used;
      if (shortage > 0) {
        current.add(UtResponsiveFlex.empty(flex: shortage));
      }
      rows.add(current);
    }

    for (var value in values) {
      if (value.flex + sum > rowFlexCount) {
        flush();
        current = <UtResponsiveFlex>[];
        sum = 0;
      }
      current.add(value);
      sum += value.flex;
    }
    if (current.isNotEmpty) {
      flush();
    }
    return rows;
  }
}
