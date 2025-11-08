// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'custom_theme_model.dart';

class CustomThemeModelMapper extends ClassMapperBase<CustomThemeModel> {
  CustomThemeModelMapper._();

  static CustomThemeModelMapper? _instance;
  static CustomThemeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomThemeModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CustomThemeModel';

  static InvalidType _$selectedOption(CustomThemeModel v) => v.selectedOption;
  static const Field<CustomThemeModel, InvalidType> _f$selectedOption = Field(
    'selectedOption',
    _$selectedOption,
    opt: true,
    def: CustomThemeOption.system,
  );
  static bool _$isDark(CustomThemeModel v) => v.isDark;
  static const Field<CustomThemeModel, bool> _f$isDark = Field(
    'isDark',
    _$isDark,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<CustomThemeModel> fields = const {
    #selectedOption: _f$selectedOption,
    #isDark: _f$isDark,
  };

  static CustomThemeModel _instantiate(DecodingData data) {
    return CustomThemeModel(
      selectedOption: data.dec(_f$selectedOption),
      isDark: data.dec(_f$isDark),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CustomThemeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomThemeModel>(map);
  }

  static CustomThemeModel fromJson(String json) {
    return ensureInitialized().decodeJson<CustomThemeModel>(json);
  }
}

mixin CustomThemeModelMappable {
  String toJson() {
    return CustomThemeModelMapper.ensureInitialized()
        .encodeJson<CustomThemeModel>(this as CustomThemeModel);
  }

  Map<String, dynamic> toMap() {
    return CustomThemeModelMapper.ensureInitialized()
        .encodeMap<CustomThemeModel>(this as CustomThemeModel);
  }

  CustomThemeModelCopyWith<CustomThemeModel, CustomThemeModel, CustomThemeModel>
  get copyWith =>
      _CustomThemeModelCopyWithImpl<CustomThemeModel, CustomThemeModel>(
        this as CustomThemeModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CustomThemeModelMapper.ensureInitialized().stringifyValue(
      this as CustomThemeModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CustomThemeModelMapper.ensureInitialized().equalsValue(
      this as CustomThemeModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CustomThemeModelMapper.ensureInitialized().hashValue(
      this as CustomThemeModel,
    );
  }
}

extension CustomThemeModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomThemeModel, $Out> {
  CustomThemeModelCopyWith<$R, CustomThemeModel, $Out>
  get $asCustomThemeModel =>
      $base.as((v, t, t2) => _CustomThemeModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomThemeModelCopyWith<$R, $In extends CustomThemeModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({InvalidType? selectedOption, bool? isDark});
  CustomThemeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CustomThemeModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomThemeModel, $Out>
    implements CustomThemeModelCopyWith<$R, CustomThemeModel, $Out> {
  _CustomThemeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomThemeModel> $mapper =
      CustomThemeModelMapper.ensureInitialized();
  @override
  $R call({InvalidType? selectedOption, bool? isDark}) => $apply(
    FieldCopyWithData({
      if (selectedOption != null) #selectedOption: selectedOption,
      if (isDark != null) #isDark: isDark,
    }),
  );
  @override
  CustomThemeModel $make(CopyWithData data) => CustomThemeModel(
    selectedOption: data.get(#selectedOption, or: $value.selectedOption),
    isDark: data.get(#isDark, or: $value.isDark),
  );

  @override
  CustomThemeModelCopyWith<$R2, CustomThemeModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CustomThemeModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

