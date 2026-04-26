enum UtMediaBreakpoint {
  br(_br),
  mobile(_mobile),
  smallTablet(_smallTablet),
  tablet(_tablet),
  smallPc(_smallPc),
  pc(_pc);

  static const double _mobile = 599; //4
  static const double _smallTablet = 767; //8
  static const double _tablet = 959; //9
  static const double _smallPc = 1199; //12
  static const double _pc = double.infinity;
  static const double _br = double.nan;
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
