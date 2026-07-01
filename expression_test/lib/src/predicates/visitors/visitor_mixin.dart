import '../expressions/expressions.dart';
import 'visitors.dart';

///
mixin VisitorMixin<T> on Visitor<T> {
  ///dynamicで受け取った関数の引数が、ジェネリックに指定されている[T]のインスタンスかを判定する
  ///キャストできないときは例外を投げて停止。
  bool typeValidation(Expression ex, dynamic genericValue) {
    if (genericValue is! T) {
      throw AssertionError(
        'The argument to ${ex.name ?? ex.toString()} is specified as type ${T.toString()}, but the given value is of type ${genericValue.toString()}.',
      );
    }
    return false;
  }
}
