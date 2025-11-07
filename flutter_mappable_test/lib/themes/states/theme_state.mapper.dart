// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'theme_state.dart';

class ThemeStateMapper extends ClassMapperBase<ThemeState> {
  ThemeStateMapper._();

  static ThemeStateMapper? _instance;
  static ThemeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ThemeStateMapper._());
      CustomThemeOptionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ThemeState';

  static Map<CustomThemeOption, String> _$themePath(ThemeState v) =>
      v.themePath;
  static const Field<ThemeState, Map<CustomThemeOption, String>> _f$themePath =
      Field('themePath', _$themePath);
  static PairThemeData _$currentThemeData(ThemeState v) => v.currentThemeData;
  static const Field<ThemeState, PairThemeData> _f$currentThemeData = Field(
    'currentThemeData',
    _$currentThemeData,
    mode: FieldMode.member,
  );
  static CustomThemeOption _$selectedOption(ThemeState v) => v.selectedOption;
  static const Field<ThemeState, CustomThemeOption> _f$selectedOption = Field(
    'selectedOption',
    _$selectedOption,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ThemeState> fields = const {
    #themePath: _f$themePath,
    #currentThemeData: _f$currentThemeData,
    #selectedOption: _f$selectedOption,
  };

  static ThemeState _instantiate(DecodingData data) {
    return ThemeState(themePath: data.dec(_f$themePath));
  }

  @override
  final Function instantiate = _instantiate;

  static ThemeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ThemeState>(map);
  }

  static ThemeState fromJson(String json) {
    return ensureInitialized().decodeJson<ThemeState>(json);
  }
}

mixin ThemeStateMappable {
  String toJson() {
    return ThemeStateMapper.ensureInitialized().encodeJson<ThemeState>(
      this as ThemeState,
    );
  }

  Map<String, dynamic> toMap() {
    return ThemeStateMapper.ensureInitialized().encodeMap<ThemeState>(
      this as ThemeState,
    );
  }

  ThemeStateCopyWith<ThemeState, ThemeState, ThemeState> get copyWith =>
      _ThemeStateCopyWithImpl<ThemeState, ThemeState>(
        this as ThemeState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ThemeStateMapper.ensureInitialized().stringifyValue(
      this as ThemeState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ThemeStateMapper.ensureInitialized().equalsValue(
      this as ThemeState,
      other,
    );
  }

  @override
  int get hashCode {
    return ThemeStateMapper.ensureInitialized().hashValue(this as ThemeState);
  }
}

extension ThemeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ThemeState, $Out> {
  ThemeStateCopyWith<$R, ThemeState, $Out> get $asThemeState =>
      $base.as((v, t, t2) => _ThemeStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ThemeStateCopyWith<$R, $In extends ThemeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, CustomThemeOption, String, ObjectCopyWith<$R, String, String>>
  get themePath;
  $R call({Map<CustomThemeOption, String>? themePath});
  ThemeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ThemeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ThemeState, $Out>
    implements ThemeStateCopyWith<$R, ThemeState, $Out> {
  _ThemeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ThemeState> $mapper =
      ThemeStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, CustomThemeOption, String, ObjectCopyWith<$R, String, String>>
  get themePath => MapCopyWith(
    $value.themePath,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(themePath: v),
  );
  @override
  $R call({Map<CustomThemeOption, String>? themePath}) =>
      $apply(FieldCopyWithData({if (themePath != null) #themePath: themePath}));
  @override
  ThemeState $make(CopyWithData data) =>
      ThemeState(themePath: data.get(#themePath, or: $value.themePath));

  @override
  ThemeStateCopyWith<$R2, ThemeState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ThemeStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

