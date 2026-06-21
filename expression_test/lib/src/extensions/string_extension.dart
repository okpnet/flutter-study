extension StringExtension on String {
  ///文字列の前に[count]の数だけタブ(スペースX4)を追加する
  String toPrefixTab(int count) {
    String prefixs = '';
    for (var i = 0; i < count; i++) {
      prefixs += '    ';
    }
    final result = prefixs + this;
    return result;
  }
}
