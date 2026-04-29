import 'package:flutter/material.dart';

import 'ut_media_breakpoint.dart';

interface class IUtResponsiveFlex {}

class UtResponsiveFlex implements IUtResponsiveFlex {
  final UtMediaBreakpoint? hidePoint;
  final Widget? child;
  final Map<UtMediaBreakpoint, int> flexs;
  final bool cr;

  const UtResponsiveFlex._({
    required this.flexs,
    this.hidePoint,
    this.child,
    this.cr = false,
  });

  factory UtResponsiveFlex.empty({required Map<UtMediaBreakpoint, int> flexs}) {
    return UtResponsiveFlex._(flexs: flexs, cr: false, hidePoint: null);
  }

  factory UtResponsiveFlex.offset({
    required Map<UtMediaBreakpoint, int> flexs,
    UtMediaBreakpoint? hidepoint,
  }) {
    return UtResponsiveFlex._(flexs: flexs, cr: false, hidePoint: hidepoint);
  }

  factory UtResponsiveFlex.cr({UtMediaBreakpoint? hidePoint}) {
    return UtResponsiveFlex._(flexs: {}, cr: true, hidePoint: hidePoint);
  }

  factory UtResponsiveFlex.of({
    UtMediaBreakpoint? hidePoint,
    required Widget child,
    required int flex,
    int? smallPc,
    int? tablet,
    int? smallTablet,
    int? mobile,
  }) {
    return UtResponsiveFlex._(
      flexs: {
        .pc: flex,
        .smallPc: smallPc ?? flex,
        .tablet: smallTablet ?? flex,
        .smallTablet: smallTablet ?? flex,
        .mobile: mobile ?? flex,
      },
      cr: false,
      hidePoint: hidePoint ?? .mobile,
      child: child,
    );
  }

  UtResponsiveFlex copyWith({
    UtMediaBreakpoint? hidePoint,
    Widget? child,
    Map<UtMediaBreakpoint, int>? flexs,
    bool? cr,
  }) {
    return UtResponsiveFlex._(
      hidePoint: hidePoint ?? this.hidePoint,
      child: child ?? this.child,
      flexs: flexs ?? this.flexs,
      cr: cr ?? this.cr,
    );
  }
}
