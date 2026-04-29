import 'package:responsive_test/responsive/ut_media_breakpoint.dart';

extension UtGridFlexExtension on Map<UtMediaBreakpoint, int> {
  int getFlex(UtMediaBreakpoint bp) {
    if (!containsKey(bp)) return this[UtMediaBreakpoint.pc] ?? 0;
    return this[bp]!;
  }

  ///設定しているブレイクポイントの列数より大きいときは、設定しなおす
  int updateAndGetFlex(UtMediaBreakpoint bp, int flex) {
    if (!containsKey(bp) || this[bp]! > flex) {
      this[bp] = flex;
    }
    return this[bp]!;
  }
}
