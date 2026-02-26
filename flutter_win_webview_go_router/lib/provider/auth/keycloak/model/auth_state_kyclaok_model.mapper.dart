// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_state_kyclaok_model.dart';

class AuthStateKyclaokModelMapper
    extends ClassMapperBase<AuthStateKyclaokModel> {
  AuthStateKyclaokModelMapper._();

  static AuthStateKyclaokModelMapper? _instance;
  static AuthStateKyclaokModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateKyclaokModelMapper._());
      AuthenticationModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthStateKyclaokModel';

  static String? _$accessToken(AuthStateKyclaokModel v) => v.accessToken;
  static const Field<AuthStateKyclaokModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
  );
  static String? _$refreshToken(AuthStateKyclaokModel v) => v.refreshToken;
  static const Field<AuthStateKyclaokModel, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
  );
  static String? _$tokenId(AuthStateKyclaokModel v) => v.tokenId;
  static const Field<AuthStateKyclaokModel, String> _f$tokenId = Field(
    'tokenId',
    _$tokenId,
  );
  static String? _$code(AuthStateKyclaokModel v) => v.code;
  static const Field<AuthStateKyclaokModel, String> _f$code = Field(
    'code',
    _$code,
  );

  @override
  final MappableFields<AuthStateKyclaokModel> fields = const {
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
    #tokenId: _f$tokenId,
    #code: _f$code,
  };

  static AuthStateKyclaokModel _instantiate(DecodingData data) {
    return AuthStateKyclaokModel(
      accessToken: data.dec(_f$accessToken),
      refreshToken: data.dec(_f$refreshToken),
      tokenId: data.dec(_f$tokenId),
      code: data.dec(_f$code),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthStateKyclaokModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthStateKyclaokModel>(map);
  }

  static AuthStateKyclaokModel fromJson(String json) {
    return ensureInitialized().decodeJson<AuthStateKyclaokModel>(json);
  }
}

mixin AuthStateKyclaokModelMappable {
  String toJson() {
    return AuthStateKyclaokModelMapper.ensureInitialized()
        .encodeJson<AuthStateKyclaokModel>(this as AuthStateKyclaokModel);
  }

  Map<String, dynamic> toMap() {
    return AuthStateKyclaokModelMapper.ensureInitialized()
        .encodeMap<AuthStateKyclaokModel>(this as AuthStateKyclaokModel);
  }

  AuthStateKyclaokModelCopyWith<
    AuthStateKyclaokModel,
    AuthStateKyclaokModel,
    AuthStateKyclaokModel
  >
  get copyWith =>
      _AuthStateKyclaokModelCopyWithImpl<
        AuthStateKyclaokModel,
        AuthStateKyclaokModel
      >(this as AuthStateKyclaokModel, $identity, $identity);
  @override
  String toString() {
    return AuthStateKyclaokModelMapper.ensureInitialized().stringifyValue(
      this as AuthStateKyclaokModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthStateKyclaokModelMapper.ensureInitialized().equalsValue(
      this as AuthStateKyclaokModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthStateKyclaokModelMapper.ensureInitialized().hashValue(
      this as AuthStateKyclaokModel,
    );
  }
}

extension AuthStateKyclaokModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthStateKyclaokModel, $Out> {
  AuthStateKyclaokModelCopyWith<$R, AuthStateKyclaokModel, $Out>
  get $asAuthStateKyclaokModel => $base.as(
    (v, t, t2) => _AuthStateKyclaokModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AuthStateKyclaokModelCopyWith<
  $R,
  $In extends AuthStateKyclaokModel,
  $Out
>
    implements AuthenticationModelCopyWith<$R, $In, $Out> {
  @override
  $R call({
    String? accessToken,
    String? refreshToken,
    String? tokenId,
    String? code,
  });
  AuthStateKyclaokModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AuthStateKyclaokModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthStateKyclaokModel, $Out>
    implements AuthStateKyclaokModelCopyWith<$R, AuthStateKyclaokModel, $Out> {
  _AuthStateKyclaokModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthStateKyclaokModel> $mapper =
      AuthStateKyclaokModelMapper.ensureInitialized();
  @override
  $R call({
    Object? accessToken = $none,
    Object? refreshToken = $none,
    Object? tokenId = $none,
    Object? code = $none,
  }) => $apply(
    FieldCopyWithData({
      if (accessToken != $none) #accessToken: accessToken,
      if (refreshToken != $none) #refreshToken: refreshToken,
      if (tokenId != $none) #tokenId: tokenId,
      if (code != $none) #code: code,
    }),
  );
  @override
  AuthStateKyclaokModel $make(CopyWithData data) => AuthStateKyclaokModel(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    refreshToken: data.get(#refreshToken, or: $value.refreshToken),
    tokenId: data.get(#tokenId, or: $value.tokenId),
    code: data.get(#code, or: $value.code),
  );

  @override
  AuthStateKyclaokModelCopyWith<$R2, AuthStateKyclaokModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AuthStateKyclaokModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

