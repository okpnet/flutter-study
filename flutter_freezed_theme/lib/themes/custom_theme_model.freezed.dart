// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomThemeModel implements DiagnosticableTreeMixin {

 ThemeMode get mode;
/// Create a copy of CustomThemeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomThemeModelCopyWith<CustomThemeModel> get copyWith => _$CustomThemeModelCopyWithImpl<CustomThemeModel>(this as CustomThemeModel, _$identity);

  /// Serializes this CustomThemeModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CustomThemeModel'))
    ..add(DiagnosticsProperty('mode', mode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomThemeModel&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CustomThemeModel(mode: $mode)';
}


}

/// @nodoc
abstract mixin class $CustomThemeModelCopyWith<$Res>  {
  factory $CustomThemeModelCopyWith(CustomThemeModel value, $Res Function(CustomThemeModel) _then) = _$CustomThemeModelCopyWithImpl;
@useResult
$Res call({
 ThemeMode mode
});




}
/// @nodoc
class _$CustomThemeModelCopyWithImpl<$Res>
    implements $CustomThemeModelCopyWith<$Res> {
  _$CustomThemeModelCopyWithImpl(this._self, this._then);

  final CustomThemeModel _self;
  final $Res Function(CustomThemeModel) _then;

/// Create a copy of CustomThemeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomThemeModel].
extension CustomThemeModelPatterns on CustomThemeModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomThemeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomThemeModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomThemeModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomThemeModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomThemeModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomThemeModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomThemeModel() when $default != null:
return $default(_that.mode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode mode)  $default,) {final _that = this;
switch (_that) {
case _CustomThemeModel():
return $default(_that.mode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode mode)?  $default,) {final _that = this;
switch (_that) {
case _CustomThemeModel() when $default != null:
return $default(_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomThemeModel with DiagnosticableTreeMixin implements CustomThemeModel {
  const _CustomThemeModel({required this.mode});
  factory _CustomThemeModel.fromJson(Map<String, dynamic> json) => _$CustomThemeModelFromJson(json);

@override final  ThemeMode mode;

/// Create a copy of CustomThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomThemeModelCopyWith<_CustomThemeModel> get copyWith => __$CustomThemeModelCopyWithImpl<_CustomThemeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomThemeModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CustomThemeModel'))
    ..add(DiagnosticsProperty('mode', mode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomThemeModel&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CustomThemeModel(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$CustomThemeModelCopyWith<$Res> implements $CustomThemeModelCopyWith<$Res> {
  factory _$CustomThemeModelCopyWith(_CustomThemeModel value, $Res Function(_CustomThemeModel) _then) = __$CustomThemeModelCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode mode
});




}
/// @nodoc
class __$CustomThemeModelCopyWithImpl<$Res>
    implements _$CustomThemeModelCopyWith<$Res> {
  __$CustomThemeModelCopyWithImpl(this._self, this._then);

  final _CustomThemeModel _self;
  final $Res Function(_CustomThemeModel) _then;

/// Create a copy of CustomThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_CustomThemeModel(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
