import 'package:flutter/material.dart';

import 'ut_media_breakpoint.dart';

interface class IUtResponsiveFlex {}

class UtResponsiveFlex extends StatelessWidget implements IUtResponsiveFlex {
  final UtMediaBreakpoint? hidePoint;
  final Widget? child;
  final int flex;
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
    return Align(alignment: Alignment.centerLeft, child: child);
  }

  factory UtResponsiveFlex.empty({Key? key, required int flex}) {
    return UtResponsiveFlex._(key: key, flex: flex, cr: false, hidePoint: null);
  }

  factory UtResponsiveFlex.cr({Key? key}) {
    return UtResponsiveFlex._(key: key, flex: 0, cr: true, hidePoint: null);
  }

  factory UtResponsiveFlex.of({
    Key? key,
    UtMediaBreakpoint? hidePoint,
    required Widget child,
    required int flex,
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
