import 'package:flutter/material.dart';
import 'package:responsive_test/responsive/ut_grid_flex_style.dart';
import 'package:responsive_test/responsive/ut_list_extension.dart';
import 'package:responsive_test/responsive/ut_media_breakpoint.dart';
import 'package:responsive_test/responsive/ut_responsive_flex.dart';

class UtResponsiveGrid extends StatelessWidget {
  final double? flexMinWidth;
  final List<UtResponsiveFlex> children;
  final double spacing;
  final int maxFlex = 12; //ブレイクポイントがEunumで指定されているので固定
  final CrossAxisAlignment verticalAlignment;

  const UtResponsiveGrid({
    super.key,
    this.flexMinWidth,
    required this.children,
    this.verticalAlignment = .start,
    this.spacing = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //コンテンツ幅
        final widgetWidth = constraints.widthConstraints().maxWidth;
        //現在の幅ブレイクポイント
        final type = UtMediaBreakpoint.of(widgetWidth);
        //ブレイクポイントの列数
        final rowFlex = type.flexMaxCount;

        //ブレークポイント付の有効な子の
        final activeChildren = children
            .where((t) => t.hidePoint == null || type.isVisibleAt(t.hidePoint!))
            .splitWhere((t) => t.cr);

        return Column(
          crossAxisAlignment: .stretch,
          children: [
            for (var rows in activeChildren)
              for (var row in buildRows(rows, rowFlex))
                isBuildWidgetContainer(activeChildren.last == row, row),
          ],
        );
      },
    );
  }

  //[spacing]の有無によって全集余白の切り替え
  Widget isBuildWidgetContainer(bool isLast, List<UtResponsiveFlex> list) {
    if (0 >= spacing) {
      return buildWidgetRow(list);
    }

    return Container(
      margin: isLast
          ? EdgeInsets.all(spacing)
          : EdgeInsets.only(
              right: spacing,
              left: spacing,
              top: spacing,
            ), //下に行があるのでBottomを除く
      child: buildWidgetRow(list),
    );
  }

  //行描画
  Widget buildWidgetRow(List<UtResponsiveFlex> list) {
    return Row(
      crossAxisAlignment: verticalAlignment,
      spacing: spacing,
      children: [
        for (var value in list)
          Expanded(
            //行の直接の子はFlexを持つExpanded
            flex: value.flex.flex,
            child: value.child ?? SizedBox.shrink(),
          ),
      ],
    );
  }

  //行の成形
  List<List<UtResponsiveFlex>> buildRows(
    List<UtResponsiveFlex> values,
    int rowFlex,
  ) {
    final rows = <List<UtResponsiveFlex>>[];
    var current = <UtResponsiveFlex>[];
    var sum = 0;

    void flush() {
      final used = current.fold(0, (a, b) => a + b.flex.flex);
      final shortage = rowFlex - used;
      if (shortage > 0) {
        current.add(
          UtResponsiveFlex.offset(flex: UtGridFlexStyle.of(shortage)),
        );
      }
      rows.add(current);
    }

    for (var item in values) {
      final cloan = item.copyWith(
        flex: item.flex.flex > rowFlex
            ? UtGridFlexStyle.of(rowFlex)
            : item.flex,
      );
      if (cloan.flex.flex + sum > rowFlex) {
        flush();
        current = <UtResponsiveFlex>[];
        sum = 0;
      }
      current.add(cloan);
      sum += cloan.flex.flex;
    }
    if (current.isNotEmpty) {
      flush();
    }
    return rows;
  }
}
