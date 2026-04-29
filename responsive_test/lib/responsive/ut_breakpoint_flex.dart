import 'package:responsive_test/responsive/ut_media_breakpoint.dart';

///コンテンツ幅に応じた最大列数の定義
///必要であれば書き換えたインスタンスを渡す
class UtBreakpointFlex {
  final int mobile;
  final int smallTablet;
  final int tablet;
  final int smallPc;
  final int pc;

  const UtBreakpointFlex({
    required this.mobile,
    required this.smallTablet,
    required this.tablet,
    required this.smallPc,
    required this.pc,
  });

  factory UtBreakpointFlex.defaults() => UtBreakpointFlex(
    mobile: 4,
    smallTablet: 6,
    tablet: 8,
    smallPc: 12,
    pc: 12,
  );

  int getFlexValue(UtMediaBreakpoint bp) {
    return switch (bp) {
      .mobile => mobile,
      .smallTablet => smallTablet,
      .tablet => tablet,
      .smallPc => smallPc,
      .pc => pc,
      _ => 0,
    };
  }
}
