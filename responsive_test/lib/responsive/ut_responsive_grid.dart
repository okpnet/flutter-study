import 'package:flutter/material.dart';
import 'package:responsive_test/responsive/ut_breakpoint_flex.dart';
import 'package:responsive_test/responsive/ut_grid_flex_extension.dart';
import 'package:responsive_test/responsive/ut_list_extension.dart';
import 'package:responsive_test/responsive/ut_media_breakpoint.dart';
import 'package:responsive_test/responsive/ut_responsive_flex.dart';

class UtResponsiveGrid extends StatelessWidget {
  final double? flexMinWidth;
  final List<UtResponsiveFlex> children;
  final double spacing;
  final UtBreakpointFlex? breakpointFlex;
  final CrossAxisAlignment verticalAlignment;

  const UtResponsiveGrid({
    super.key,
    this.flexMinWidth,
    required this.children,
    this.verticalAlignment = .start,
    this.spacing = 0.0,
    this.breakpointFlex,
  });

  @override
  Widget build(BuildContext context) {
    final bpFlex = breakpointFlex ?? UtBreakpointFlex.defaults();

    return LayoutBuilder(
      builder: (context, constraints) {
        //コンテンツ幅
        final widgetWidth = constraints.widthConstraints().maxWidth;
        //現在の幅ブレイクポイント
        final bp = UtMediaBreakpoint.of(widgetWidth);
        //ブレイクポイントの列数
        final rowFlex = bpFlex.getFlexValue(bp);

        //ブレークポイント付の有効な子の
        final activeChildren = children
            .where((t) => t.hidePoint == null || bp.isVisibleAt(t.hidePoint!))
            .where((t) => t.flexs.getFlex(bp) > 0)
            .splitWhere((t) => t.cr);

        return Column(
          crossAxisAlignment: .stretch,
          children: [
            for (var rows in activeChildren)
              for (var row in buildRows(bp, rows, rowFlex))
                isBuildWidgetContainer(bp, activeChildren.last == row, row),
          ],
        );
      },
    );
  }

  //[spacing]の有無によって全集余白の切り替え
  Widget isBuildWidgetContainer(
    UtMediaBreakpoint bp,
    bool isLast,
    List<UtResponsiveFlex> list,
  ) {
    if (0 >= spacing) {
      return buildWidgetRow(bp, list);
    }

    return Container(
      margin: isLast
          ? EdgeInsets.all(spacing)
          : EdgeInsets.only(
              right: spacing,
              left: spacing,
              top: spacing,
            ), //下に行があるのでBottomを除く
      child: buildWidgetRow(bp, list),
    );
  }

  //行描画
  Widget buildWidgetRow(UtMediaBreakpoint bp, List<UtResponsiveFlex> list) {
    return Row(
      crossAxisAlignment: verticalAlignment,
      spacing: spacing,
      children: [
        for (var value in list)
          Expanded(
            //行の直接の子はFlexを持つExpanded
            flex: value.flexs.getFlex(bp),
            child: value.child ?? SizedBox.shrink(),
          ),
      ],
    );
  }

  //行の成形
  List<List<UtResponsiveFlex>> buildRows(
    UtMediaBreakpoint bp,
    List<UtResponsiveFlex> values,
    int rowFlex, //行最大値
  ) {
    final rows = <List<UtResponsiveFlex>>[];
    var current = <UtResponsiveFlex>[];
    var sum = 0;

    void flush() {
      final used = current.fold(0, (a, b) => a + b.flexs.getFlex(bp));
      final shortage = rowFlex - used;
      if (shortage > 0) {
        current.add(UtResponsiveFlex.empty(flexs: {bp: shortage}));
      }
      rows.add(current);
    }

    for (var item in values) {
      final flex = item.flexs.updateAndGetFlex(bp, rowFlex);
      if (flex + sum > rowFlex) {
        flush();
        current = <UtResponsiveFlex>[];
        sum = 0;
      }
      current.add(item);
      sum += flex;
    }
    if (current.isNotEmpty) {
      flush();
    }
    return rows;
  }
}
