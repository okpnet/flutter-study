import '../visitor/visitor.dart';

abstract interface class IExpression {
  String? get name;
}

/// 基底の式ノード。
///
/// 各ノードは任意の [name] を持つことができ、ビジターを介して
/// `R Function(T)` 型の関数へと変換されます。ジェネリクスは
/// ビジター側で定義される [T], [R] を参照します。
abstract class Expression<T, R> implements IExpression {
  /// 任意の名前。
  @override
  final String? name;

  Expression({this.name});

  /// このノードを [visitor] で処理し、`R Function(T)` を返します。
  R Function(T) accept(FieldVisitor visitor);
}
