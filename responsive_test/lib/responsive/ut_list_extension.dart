extension SplitWhereExtension<T> on Iterable<T> {
  Iterable<List<T>> splitWhere(bool Function(T) isSeparator) sync* {
    var current = <T>[];

    for (final item in this) {
      if (isSeparator(item)) {
        yield current;
        current = <T>[];
      } else {
        current.add(item);
      }
    }

    yield current;
  }

  R sumBy<R extends num>(R? Function(T) selector) {
    final values = map(selector).whereType<num>();
    return values.reduce((a, b) => a + b) as R;
  }
}
