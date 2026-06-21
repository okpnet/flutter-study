import 'package:expression/src/conditions/fields/field.dart';

/// マーカーインターフェース。パッケージ外部での識別用。
///
/// 実装は `FieldVisitor` を使って表現木を走査します。
abstract interface class IFieldVisitor {}

/// 条件式ツリーを関数に変換するビジター基底クラス。
///
/// ジェネリクスは [T] が入力アイテム型、[R] が戻り値型を表します。
abstract class FieldVisitor {
  /// フィールド参照ノードを処理します。
  ///
  /// [ex]: `FieldExpression<T, R>` ノード。
  V Function(T) visitField<T, V>(FieldExpression<T, V> ex) {
    // ignore: prefer_function_declarations_over_variables
    final result = (t) => ex.field(t);
    return result;
  }

  /// 値ノードを処理します。
  ///
  /// [ex]: `ValueExpression<R>` ノード。
  R Function(T) visitValue<T, R>(ValueExpression<R> ex) {
    return (_) => ex.value;
  }

  /// 二項演算子ノードを処理します。
  ///
  /// [ex]: 演算子ノード（`OperatorExpression`）。
  R Function(T) visitOperator<T, R>(OperatorExpression<T, R> ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);
    final lStr = l.toString();
    final rStr = r.toString();
    print('l=$lStr r=$rStr');
    print(ex.delegate.toString());
    return (T item) => ex.delegate(l(item) as T, r(item) as T) as R;
  }

  /// 論理 AND ノードを処理します。
  ///
  /// [ex]: `AndExpression` ノード。
  R Function(T) visitAnd<T, R>(AndExpression<T, R> ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);

    return (T item) {
      final lb = l(item);
      final rb = r(item);
      return (lb && rb) as R;
    };
  }

  /// 論理 OR ノードを処理します。
  ///
  /// [ex]: `OrExpression` ノード。
  R Function(T) visitOr<T, R>(OrExpression<T, R> ex) {
    final l = ex.left.accept(this);
    final r = ex.right.accept(this);

    return (T item) {
          final lb = l(item);
          final rb = r(item);
          return lb || rb;
        }
        as R Function(T);
  }

  /// 範囲チェックノードを処理します。
  ///
  /// [ex]: `BetweenExpression` ノード。
  R Function(T) visitBetween<T, R>(BetweenExpression<T, R> ex) {
    // if (V is! Comparable) {
    //   throw UnsupportedError(
    //     'The general-purpose V-type  must implement Comparable.',
    //   );
    // }

    final r = R.toString();
    final t = T.toString();

    final v = ex.value.accept(this);
    final min = ex.min.accept(this);
    final max = ex.max.accept(this);

    // ignore: prefer_function_declarations_over_variables
    final result = (T item) {
      final value = v(item) as Comparable;
      final lo = min(item) as Comparable;
      final hi = max(item) as Comparable;

      return (lo.compareTo(value) <= 0 && value.compareTo(hi) <= 0) as R;
    };

    return result;
  }

  /// 包含チェックノードを処理します。
  ///
  /// [ex]: `InExpression` ノード。右辺は `Iterable` である必要があります。
  R Function(T) visitIn<T, R>(InExpression<R> ex) {
    final v = ex.value.accept(this);
    final lst = ex.list.accept(this);

    return (T item) {
      final value = v(item);
      final list = lst(item);

      if (list is Iterable) {
        return list.contains(value) as R;
      }
      throw ArgumentError("Right side of IN must be Iterable");
    };
  }
}
