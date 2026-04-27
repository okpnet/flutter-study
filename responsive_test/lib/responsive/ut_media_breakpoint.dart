enum UtMediaBreakpoint {
  br(double.nan, 0), //幅無視,0列
  mobile(599, 4), //幅599,4列
  smallTablet(767, 6), //幅767,6列
  tablet(959, 8), //幅959,8列
  smallPc(1199, 12), //幅1199,12列
  pc(double.infinity, 12); //幅最大,12列

  final double width;
  final int flexMaxCount;

  const UtMediaBreakpoint(this.width, this.flexMaxCount);

  bool matches(double width) => width <= this.width;

  bool isVisibleAt(UtMediaBreakpoint hidePoint) {
    if (hidePoint == .br) {
      return true;
    }
    return width >= hidePoint.width;
  }

  factory UtMediaBreakpoint.of(double width) {
    return UtMediaBreakpoint.values.firstWhere(
      (bp) => bp.matches(width),
      orElse: () => .pc,
    );
  }
}
