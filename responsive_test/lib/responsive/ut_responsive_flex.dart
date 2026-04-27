import 'package:flutter/material.dart';
import 'package:responsive_test/responsive/ut_grid_flex_style.dart';

import 'ut_media_breakpoint.dart';

interface class IUtResponsiveFlex {}

class UtResponsiveFlex extends StatelessWidget implements IUtResponsiveFlex {
  final UtMediaBreakpoint? hidePoint;
  final Widget? child;
  final UtGridFlexStyle flex;
  final bool cr;
  const UtResponsiveFlex._({
    super.key,
    required this.flex,
    this.hidePoint,
    this.child,
    this.cr = false,
  });

  @override
  Widget build(BuildContext context) {
    if (child == null) {
      return SizedBox.shrink();
    }
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0,
      child: ColoredBox(color: Colors.redAccent, child: child),
    );
  }

  factory UtResponsiveFlex.empty({Key? key, required UtGridFlexStyle flex}) {
    return UtResponsiveFlex._(key: key, flex: flex, cr: false, hidePoint: null);
  }

  factory UtResponsiveFlex.cr({Key? key, UtMediaBreakpoint? hidePoint}) {
    return UtResponsiveFlex._(
      key: key,
      flex: .flex_1,
      cr: true,
      hidePoint: hidePoint,
    );
  }

  factory UtResponsiveFlex.of({
    Key? key,
    UtMediaBreakpoint? hidePoint,
    required Widget child,
    required UtGridFlexStyle flex,
  }) {
    return UtResponsiveFlex._(
      key: key,
      flex: flex,
      cr: false,
      hidePoint: hidePoint ?? .mobile,
      child: child,
    );
  }
}
