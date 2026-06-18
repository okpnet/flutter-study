import 'package:expression/src/fields/field.dart';
import '../visitor/visitor.dart';

/// フィールド参照を表す式ノード。
///
/// ジェネリクスの [T] は入力アイテム型、[R] はフィールドの返り値型です。
class FieldExpression<T, R> extends Expression<T, R> {
  /// 入力 [T] から取り出すフィールドアクセス関数。
  final R Function(T) field;

  FieldExpression({required this.field, super.name});

  /// ビジターでこのフィールド参照を処理します。
  ///
  /// [visitor]: 変換処理を行う [FieldVisitor]。
  /// 戻り値は `R Function(T)` 型の評価関数です。
  @override
  // ignore: avoid_shadowing_type_parameters
  R Function(T) accept(FieldVisitor visitor) {
    return visitor.visitField(this);
  }
}

/// 定数値を表す式ノード。
///
/// ジェネリクスの [R] は格納される値の型を表します。
class ValueExpression<R> extends Expression<dynamic, R> {
  /// 格納される値。
  final R value;

  ValueExpression({required this.value, super.name});

  /// ビジターでこの定数値ノードを処理します。
  ///
  /// [visitor]: 変換処理を行う [FieldVisitor]。
  /// 戻り値は `R Function(T)` 型の評価関数です。
  @override
  R Function(dynamic) accept(FieldVisitor visitor) {
    return visitor.visitValue(this);
  }
}
