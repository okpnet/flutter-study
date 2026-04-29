enum UtMediaBreakpoint {
  mobile(599), //幅599,4列
  smallTablet(767), //幅767,6列
  tablet(959), //幅959,8列
  smallPc(1199), //幅1199,12列
  pc(double.infinity); //幅最大,12列

  final double width;

  const UtMediaBreakpoint(this.width);

  bool matches(double width) => width <= this.width;

  bool isVisibleAt(UtMediaBreakpoint hidePoint) => width >= hidePoint.width;

  factory UtMediaBreakpoint.of(double width) {
    return UtMediaBreakpoint.values.firstWhere(
      (bp) => bp.matches(width),
      orElse: () => .pc,
    );
  }
}
