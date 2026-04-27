enum UtGridFlexStyle {
  flex_1(1),
  flex_2(2),
  flex_3(3),
  flex_4(4),
  flex_5(5),
  flex_6(6),
  flex_7(7),
  flex_8(8),
  flex_9(9),
  flex_10(10),
  flex_11(11),
  flex_12(12);

  final int flex;

  const UtGridFlexStyle(this.flex);

  bool matches(int flex) => flex <= this.flex;

  factory UtGridFlexStyle.of(int flex) {
    return UtGridFlexStyle.values.firstWhere(
      (bp) => bp.matches(flex),
      orElse: () => .flex_1,
    );
  }
}
