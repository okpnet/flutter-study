import 'package:flutter/material.dart';
import 'package:responsive_test/responsive/ut_grid_flex_style.dart';

import 'ut_media_breakpoint.dart';

interface class IUtResponsiveFlex {}

class UtResponsiveFlex implements IUtResponsiveFlex {
  final UtMediaBreakpoint? hidePoint;
  final Widget? child;
  final UtGridFlexStyle flex;
  final bool cr;
  const UtResponsiveFlex._({
    required this.flex,
    this.hidePoint,
    this.child,
    this.cr = false,
  });

  factory UtResponsiveFlex.empty({required UtGridFlexStyle flex}) {
    return UtResponsiveFlex._(flex: flex, cr: false, hidePoint: null);
  }

  factory UtResponsiveFlex.offset({
    required UtGridFlexStyle flex,
    UtMediaBreakpoint? hidepoint,
  }) {
    return UtResponsiveFlex._(flex: flex, cr: false, hidePoint: hidepoint);
  }

  factory UtResponsiveFlex.cr({UtMediaBreakpoint? hidePoint}) {
    return UtResponsiveFlex._(flex: .flex_1, cr: true, hidePoint: hidePoint);
  }

  factory UtResponsiveFlex.of({
    UtMediaBreakpoint? hidePoint,
    required Widget child,
    required UtGridFlexStyle flex,
  }) {
    return UtResponsiveFlex._(
      flex: flex,
      cr: false,
      hidePoint: hidePoint ?? .mobile,
      child: child,
    );
  }
  UtResponsiveFlex copyWith({
    UtMediaBreakpoint? hidePoint,
    Widget? child,
    UtGridFlexStyle? flex,
    bool? cr,
  }) {
    return UtResponsiveFlex._(
      hidePoint: hidePoint ?? this.hidePoint,
      child: child ?? this.child,
      flex: flex ?? this.flex,
      cr: cr ?? this.cr,
    );
  }
}
