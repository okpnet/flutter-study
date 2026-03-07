import 'package:gql/ast.dart';

class Query$staff {
  Query$staff({
    required this.tests_info_staff,
    this.tests_history_info_address_by_pk,
    required this.tests_info_assign,
    this.$__typename = 'query_root',
  });

  factory Query$staff.fromJson(Map<String, dynamic> json) {
    final l$tests_info_staff = json['tests_info_staff'];
    final l$tests_history_info_address_by_pk =
        json['tests_history_info_address_by_pk'];
    final l$tests_info_assign = json['tests_info_assign'];
    final l$$__typename = json['__typename'];
    return Query$staff(
      tests_info_staff: (l$tests_info_staff as List<dynamic>)
          .map(
            (e) => Query$staff$tests_info_staff.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      tests_history_info_address_by_pk:
          l$tests_history_info_address_by_pk == null
          ? null
          : Query$staff$tests_history_info_address_by_pk.fromJson(
              (l$tests_history_info_address_by_pk as Map<String, dynamic>),
            ),
      tests_info_assign: (l$tests_info_assign as List<dynamic>)
          .map(
            (e) => Query$staff$tests_info_assign.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$staff$tests_info_staff> tests_info_staff;

  final Query$staff$tests_history_info_address_by_pk?
  tests_history_info_address_by_pk;

  final List<Query$staff$tests_info_assign> tests_info_assign;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$tests_info_staff = tests_info_staff;
    _resultData['tests_info_staff'] = l$tests_info_staff
        .map((e) => e.toJson())
        .toList();
    final l$tests_history_info_address_by_pk = tests_history_info_address_by_pk;
    _resultData['tests_history_info_address_by_pk'] =
        l$tests_history_info_address_by_pk?.toJson();
    final l$tests_info_assign = tests_info_assign;
    _resultData['tests_info_assign'] = l$tests_info_assign
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$tests_info_staff = tests_info_staff;
    final l$tests_history_info_address_by_pk = tests_history_info_address_by_pk;
    final l$tests_info_assign = tests_info_assign;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$tests_info_staff.map((v) => v)),
      l$tests_history_info_address_by_pk,
      Object.hashAll(l$tests_info_assign.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$staff || runtimeType != other.runtimeType) {
      return false;
    }
    final l$tests_info_staff = tests_info_staff;
    final lOther$tests_info_staff = other.tests_info_staff;
    if (l$tests_info_staff.length != lOther$tests_info_staff.length) {
      return false;
    }
    for (int i = 0; i < l$tests_info_staff.length; i++) {
      final l$tests_info_staff$entry = l$tests_info_staff[i];
      final lOther$tests_info_staff$entry = lOther$tests_info_staff[i];
      if (l$tests_info_staff$entry != lOther$tests_info_staff$entry) {
        return false;
      }
    }
    final l$tests_history_info_address_by_pk = tests_history_info_address_by_pk;
    final lOther$tests_history_info_address_by_pk =
        other.tests_history_info_address_by_pk;
    if (l$tests_history_info_address_by_pk !=
        lOther$tests_history_info_address_by_pk) {
      return false;
    }
    final l$tests_info_assign = tests_info_assign;
    final lOther$tests_info_assign = other.tests_info_assign;
    if (l$tests_info_assign.length != lOther$tests_info_assign.length) {
      return false;
    }
    for (int i = 0; i < l$tests_info_assign.length; i++) {
      final l$tests_info_assign$entry = l$tests_info_assign[i];
      final lOther$tests_info_assign$entry = lOther$tests_info_assign[i];
      if (l$tests_info_assign$entry != lOther$tests_info_assign$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$staff on Query$staff {
  CopyWith$Query$staff<Query$staff> get copyWith =>
      CopyWith$Query$staff(this, (i) => i);
}

abstract class CopyWith$Query$staff<TRes> {
  factory CopyWith$Query$staff(
    Query$staff instance,
    TRes Function(Query$staff) then,
  ) = _CopyWithImpl$Query$staff;

  factory CopyWith$Query$staff.stub(TRes res) = _CopyWithStubImpl$Query$staff;

  TRes call({
    List<Query$staff$tests_info_staff>? tests_info_staff,
    Query$staff$tests_history_info_address_by_pk?
    tests_history_info_address_by_pk,
    List<Query$staff$tests_info_assign>? tests_info_assign,
    String? $__typename,
  });
  TRes tests_info_staff(
    Iterable<Query$staff$tests_info_staff> Function(
      Iterable<
        CopyWith$Query$staff$tests_info_staff<Query$staff$tests_info_staff>
      >,
    )
    _fn,
  );
  CopyWith$Query$staff$tests_history_info_address_by_pk<TRes>
  get tests_history_info_address_by_pk;
  TRes tests_info_assign(
    Iterable<Query$staff$tests_info_assign> Function(
      Iterable<
        CopyWith$Query$staff$tests_info_assign<Query$staff$tests_info_assign>
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$staff<TRes> implements CopyWith$Query$staff<TRes> {
  _CopyWithImpl$Query$staff(this._instance, this._then);

  final Query$staff _instance;

  final TRes Function(Query$staff) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tests_info_staff = _undefined,
    Object? tests_history_info_address_by_pk = _undefined,
    Object? tests_info_assign = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$staff(
      tests_info_staff:
          tests_info_staff == _undefined || tests_info_staff == null
          ? _instance.tests_info_staff
          : (tests_info_staff as List<Query$staff$tests_info_staff>),
      tests_history_info_address_by_pk:
          tests_history_info_address_by_pk == _undefined
          ? _instance.tests_history_info_address_by_pk
          : (tests_history_info_address_by_pk
                as Query$staff$tests_history_info_address_by_pk?),
      tests_info_assign:
          tests_info_assign == _undefined || tests_info_assign == null
          ? _instance.tests_info_assign
          : (tests_info_assign as List<Query$staff$tests_info_assign>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes tests_info_staff(
    Iterable<Query$staff$tests_info_staff> Function(
      Iterable<
        CopyWith$Query$staff$tests_info_staff<Query$staff$tests_info_staff>
      >,
    )
    _fn,
  ) => call(
    tests_info_staff: _fn(
      _instance.tests_info_staff.map(
        (e) => CopyWith$Query$staff$tests_info_staff(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$staff$tests_history_info_address_by_pk<TRes>
  get tests_history_info_address_by_pk {
    final local$tests_history_info_address_by_pk =
        _instance.tests_history_info_address_by_pk;
    return local$tests_history_info_address_by_pk == null
        ? CopyWith$Query$staff$tests_history_info_address_by_pk.stub(
            _then(_instance),
          )
        : CopyWith$Query$staff$tests_history_info_address_by_pk(
            local$tests_history_info_address_by_pk,
            (e) => call(tests_history_info_address_by_pk: e),
          );
  }

  TRes tests_info_assign(
    Iterable<Query$staff$tests_info_assign> Function(
      Iterable<
        CopyWith$Query$staff$tests_info_assign<Query$staff$tests_info_assign>
      >,
    )
    _fn,
  ) => call(
    tests_info_assign: _fn(
      _instance.tests_info_assign.map(
        (e) => CopyWith$Query$staff$tests_info_assign(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$staff<TRes>
    implements CopyWith$Query$staff<TRes> {
  _CopyWithStubImpl$Query$staff(this._res);

  TRes _res;

  call({
    List<Query$staff$tests_info_staff>? tests_info_staff,
    Query$staff$tests_history_info_address_by_pk?
    tests_history_info_address_by_pk,
    List<Query$staff$tests_info_assign>? tests_info_assign,
    String? $__typename,
  }) => _res;

  tests_info_staff(_fn) => _res;

  CopyWith$Query$staff$tests_history_info_address_by_pk<TRes>
  get tests_history_info_address_by_pk =>
      CopyWith$Query$staff$tests_history_info_address_by_pk.stub(_res);

  tests_info_assign(_fn) => _res;
}

const documentNodeQuerystaff = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'staff'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'tests_info_staff'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'distinct_on'),
                value: EnumValueNode(name: NameNode(value: 'code')),
              ),
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: IntValueNode(value: '1000'),
              ),
              ArgumentNode(
                name: NameNode(value: 'where'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'remove'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: '_eq'),
                            value: BooleanValueNode(value: false),
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: '_is_null'),
                            value: BooleanValueNode(value: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'code'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'info_company_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'info_office_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'kana'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'phone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'private_phone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'remarks'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'remove'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'revision'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'sex'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'update_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'update_user_history_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'update_user_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: 'tests_history_info_address_by_pk'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tests_info_assign'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);

class Query$staff$tests_info_staff {
  Query$staff$tests_info_staff({
    this.code,
    this.info_company_id,
    this.info_office_id,
    this.kana,
    this.phone,
    this.private_phone,
    this.remarks,
    this.remove,
    this.revision,
    this.sex,
    this.update_at,
    this.update_user_history_id,
    this.update_user_id,
    this.$__typename = 'tests_info_staff',
  });

  factory Query$staff$tests_info_staff.fromJson(Map<String, dynamic> json) {
    final l$code = json['code'];
    final l$info_company_id = json['info_company_id'];
    final l$info_office_id = json['info_office_id'];
    final l$kana = json['kana'];
    final l$phone = json['phone'];
    final l$private_phone = json['private_phone'];
    final l$remarks = json['remarks'];
    final l$remove = json['remove'];
    final l$revision = json['revision'];
    final l$sex = json['sex'];
    final l$update_at = json['update_at'];
    final l$update_user_history_id = json['update_user_history_id'];
    final l$update_user_id = json['update_user_id'];
    final l$$__typename = json['__typename'];
    return Query$staff$tests_info_staff(
      code: (l$code as String?),
      info_company_id: (l$info_company_id as String?),
      info_office_id: (l$info_office_id as String?),
      kana: (l$kana as String?),
      phone: (l$phone as String?),
      private_phone: (l$private_phone as String?),
      remarks: (l$remarks as String?),
      remove: (l$remove as bool?),
      revision: (l$revision as int?),
      sex: (l$sex as String?),
      update_at: (l$update_at as String?),
      update_user_history_id: (l$update_user_history_id as String?),
      update_user_id: (l$update_user_id as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? code;

  final String? info_company_id;

  final String? info_office_id;

  final String? kana;

  final String? phone;

  final String? private_phone;

  final String? remarks;

  final bool? remove;

  final int? revision;

  final String? sex;

  final String? update_at;

  final String? update_user_history_id;

  final String? update_user_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$info_company_id = info_company_id;
    _resultData['info_company_id'] = l$info_company_id;
    final l$info_office_id = info_office_id;
    _resultData['info_office_id'] = l$info_office_id;
    final l$kana = kana;
    _resultData['kana'] = l$kana;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$private_phone = private_phone;
    _resultData['private_phone'] = l$private_phone;
    final l$remarks = remarks;
    _resultData['remarks'] = l$remarks;
    final l$remove = remove;
    _resultData['remove'] = l$remove;
    final l$revision = revision;
    _resultData['revision'] = l$revision;
    final l$sex = sex;
    _resultData['sex'] = l$sex;
    final l$update_at = update_at;
    _resultData['update_at'] = l$update_at;
    final l$update_user_history_id = update_user_history_id;
    _resultData['update_user_history_id'] = l$update_user_history_id;
    final l$update_user_id = update_user_id;
    _resultData['update_user_id'] = l$update_user_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$info_company_id = info_company_id;
    final l$info_office_id = info_office_id;
    final l$kana = kana;
    final l$phone = phone;
    final l$private_phone = private_phone;
    final l$remarks = remarks;
    final l$remove = remove;
    final l$revision = revision;
    final l$sex = sex;
    final l$update_at = update_at;
    final l$update_user_history_id = update_user_history_id;
    final l$update_user_id = update_user_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$info_company_id,
      l$info_office_id,
      l$kana,
      l$phone,
      l$private_phone,
      l$remarks,
      l$remove,
      l$revision,
      l$sex,
      l$update_at,
      l$update_user_history_id,
      l$update_user_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$staff$tests_info_staff ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    final l$info_company_id = info_company_id;
    final lOther$info_company_id = other.info_company_id;
    if (l$info_company_id != lOther$info_company_id) {
      return false;
    }
    final l$info_office_id = info_office_id;
    final lOther$info_office_id = other.info_office_id;
    if (l$info_office_id != lOther$info_office_id) {
      return false;
    }
    final l$kana = kana;
    final lOther$kana = other.kana;
    if (l$kana != lOther$kana) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$private_phone = private_phone;
    final lOther$private_phone = other.private_phone;
    if (l$private_phone != lOther$private_phone) {
      return false;
    }
    final l$remarks = remarks;
    final lOther$remarks = other.remarks;
    if (l$remarks != lOther$remarks) {
      return false;
    }
    final l$remove = remove;
    final lOther$remove = other.remove;
    if (l$remove != lOther$remove) {
      return false;
    }
    final l$revision = revision;
    final lOther$revision = other.revision;
    if (l$revision != lOther$revision) {
      return false;
    }
    final l$sex = sex;
    final lOther$sex = other.sex;
    if (l$sex != lOther$sex) {
      return false;
    }
    final l$update_at = update_at;
    final lOther$update_at = other.update_at;
    if (l$update_at != lOther$update_at) {
      return false;
    }
    final l$update_user_history_id = update_user_history_id;
    final lOther$update_user_history_id = other.update_user_history_id;
    if (l$update_user_history_id != lOther$update_user_history_id) {
      return false;
    }
    final l$update_user_id = update_user_id;
    final lOther$update_user_id = other.update_user_id;
    if (l$update_user_id != lOther$update_user_id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$staff$tests_info_staff
    on Query$staff$tests_info_staff {
  CopyWith$Query$staff$tests_info_staff<Query$staff$tests_info_staff>
  get copyWith => CopyWith$Query$staff$tests_info_staff(this, (i) => i);
}

abstract class CopyWith$Query$staff$tests_info_staff<TRes> {
  factory CopyWith$Query$staff$tests_info_staff(
    Query$staff$tests_info_staff instance,
    TRes Function(Query$staff$tests_info_staff) then,
  ) = _CopyWithImpl$Query$staff$tests_info_staff;

  factory CopyWith$Query$staff$tests_info_staff.stub(TRes res) =
      _CopyWithStubImpl$Query$staff$tests_info_staff;

  TRes call({
    String? code,
    String? info_company_id,
    String? info_office_id,
    String? kana,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    int? revision,
    String? sex,
    String? update_at,
    String? update_user_history_id,
    String? update_user_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$staff$tests_info_staff<TRes>
    implements CopyWith$Query$staff$tests_info_staff<TRes> {
  _CopyWithImpl$Query$staff$tests_info_staff(this._instance, this._then);

  final Query$staff$tests_info_staff _instance;

  final TRes Function(Query$staff$tests_info_staff) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? info_company_id = _undefined,
    Object? info_office_id = _undefined,
    Object? kana = _undefined,
    Object? phone = _undefined,
    Object? private_phone = _undefined,
    Object? remarks = _undefined,
    Object? remove = _undefined,
    Object? revision = _undefined,
    Object? sex = _undefined,
    Object? update_at = _undefined,
    Object? update_user_history_id = _undefined,
    Object? update_user_id = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$staff$tests_info_staff(
      code: code == _undefined ? _instance.code : (code as String?),
      info_company_id: info_company_id == _undefined
          ? _instance.info_company_id
          : (info_company_id as String?),
      info_office_id: info_office_id == _undefined
          ? _instance.info_office_id
          : (info_office_id as String?),
      kana: kana == _undefined ? _instance.kana : (kana as String?),
      phone: phone == _undefined ? _instance.phone : (phone as String?),
      private_phone: private_phone == _undefined
          ? _instance.private_phone
          : (private_phone as String?),
      remarks: remarks == _undefined ? _instance.remarks : (remarks as String?),
      remove: remove == _undefined ? _instance.remove : (remove as bool?),
      revision: revision == _undefined
          ? _instance.revision
          : (revision as int?),
      sex: sex == _undefined ? _instance.sex : (sex as String?),
      update_at: update_at == _undefined
          ? _instance.update_at
          : (update_at as String?),
      update_user_history_id: update_user_history_id == _undefined
          ? _instance.update_user_history_id
          : (update_user_history_id as String?),
      update_user_id: update_user_id == _undefined
          ? _instance.update_user_id
          : (update_user_id as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$staff$tests_info_staff<TRes>
    implements CopyWith$Query$staff$tests_info_staff<TRes> {
  _CopyWithStubImpl$Query$staff$tests_info_staff(this._res);

  TRes _res;

  call({
    String? code,
    String? info_company_id,
    String? info_office_id,
    String? kana,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    int? revision,
    String? sex,
    String? update_at,
    String? update_user_history_id,
    String? update_user_id,
    String? $__typename,
  }) => _res;
}

class Query$staff$tests_history_info_address_by_pk {
  Query$staff$tests_history_info_address_by_pk();

  factory Query$staff$tests_history_info_address_by_pk.fromJson(
    Map<String, dynamic> json,
  ) {
    return Query$staff$tests_history_info_address_by_pk();
  }

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    return _resultData;
  }

  @override
  int get hashCode {
    return Object.hashAll([]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$staff$tests_history_info_address_by_pk ||
        runtimeType != other.runtimeType) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$staff$tests_history_info_address_by_pk
    on Query$staff$tests_history_info_address_by_pk {
  CopyWith$Query$staff$tests_history_info_address_by_pk<
    Query$staff$tests_history_info_address_by_pk
  >
  get copyWith =>
      CopyWith$Query$staff$tests_history_info_address_by_pk(this, (i) => i);
}

abstract class CopyWith$Query$staff$tests_history_info_address_by_pk<TRes> {
  factory CopyWith$Query$staff$tests_history_info_address_by_pk(
    Query$staff$tests_history_info_address_by_pk instance,
    TRes Function(Query$staff$tests_history_info_address_by_pk) then,
  ) = _CopyWithImpl$Query$staff$tests_history_info_address_by_pk;

  factory CopyWith$Query$staff$tests_history_info_address_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$staff$tests_history_info_address_by_pk;

  TRes call();
}

class _CopyWithImpl$Query$staff$tests_history_info_address_by_pk<TRes>
    implements CopyWith$Query$staff$tests_history_info_address_by_pk<TRes> {
  _CopyWithImpl$Query$staff$tests_history_info_address_by_pk(
    this._instance,
    this._then,
  );

  final Query$staff$tests_history_info_address_by_pk _instance;

  final TRes Function(Query$staff$tests_history_info_address_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call() => _then(Query$staff$tests_history_info_address_by_pk());
}

class _CopyWithStubImpl$Query$staff$tests_history_info_address_by_pk<TRes>
    implements CopyWith$Query$staff$tests_history_info_address_by_pk<TRes> {
  _CopyWithStubImpl$Query$staff$tests_history_info_address_by_pk(this._res);

  TRes _res;

  call() => _res;
}

class Query$staff$tests_info_assign {
  Query$staff$tests_info_assign();

  factory Query$staff$tests_info_assign.fromJson(Map<String, dynamic> json) {
    return Query$staff$tests_info_assign();
  }

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    return _resultData;
  }

  @override
  int get hashCode {
    return Object.hashAll([]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$staff$tests_info_assign ||
        runtimeType != other.runtimeType) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$staff$tests_info_assign
    on Query$staff$tests_info_assign {
  CopyWith$Query$staff$tests_info_assign<Query$staff$tests_info_assign>
  get copyWith => CopyWith$Query$staff$tests_info_assign(this, (i) => i);
}

abstract class CopyWith$Query$staff$tests_info_assign<TRes> {
  factory CopyWith$Query$staff$tests_info_assign(
    Query$staff$tests_info_assign instance,
    TRes Function(Query$staff$tests_info_assign) then,
  ) = _CopyWithImpl$Query$staff$tests_info_assign;

  factory CopyWith$Query$staff$tests_info_assign.stub(TRes res) =
      _CopyWithStubImpl$Query$staff$tests_info_assign;

  TRes call();
}

class _CopyWithImpl$Query$staff$tests_info_assign<TRes>
    implements CopyWith$Query$staff$tests_info_assign<TRes> {
  _CopyWithImpl$Query$staff$tests_info_assign(this._instance, this._then);

  final Query$staff$tests_info_assign _instance;

  final TRes Function(Query$staff$tests_info_assign) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call() => _then(Query$staff$tests_info_assign());
}

class _CopyWithStubImpl$Query$staff$tests_info_assign<TRes>
    implements CopyWith$Query$staff$tests_info_assign<TRes> {
  _CopyWithStubImpl$Query$staff$tests_info_assign(this._res);

  TRes _res;

  call() => _res;
}

class Mutation$MyMutation {
  Mutation$MyMutation({
    this.delete_tests_info_staff,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$MyMutation.fromJson(Map<String, dynamic> json) {
    final l$delete_tests_info_staff = json['delete_tests_info_staff'];
    final l$$__typename = json['__typename'];
    return Mutation$MyMutation(
      delete_tests_info_staff: l$delete_tests_info_staff == null
          ? null
          : Mutation$MyMutation$delete_tests_info_staff.fromJson(
              (l$delete_tests_info_staff as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$MyMutation$delete_tests_info_staff? delete_tests_info_staff;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_tests_info_staff = delete_tests_info_staff;
    _resultData['delete_tests_info_staff'] = l$delete_tests_info_staff
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_tests_info_staff = delete_tests_info_staff;
    final l$$__typename = $__typename;
    return Object.hashAll([l$delete_tests_info_staff, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MyMutation || runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_tests_info_staff = delete_tests_info_staff;
    final lOther$delete_tests_info_staff = other.delete_tests_info_staff;
    if (l$delete_tests_info_staff != lOther$delete_tests_info_staff) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$MyMutation on Mutation$MyMutation {
  CopyWith$Mutation$MyMutation<Mutation$MyMutation> get copyWith =>
      CopyWith$Mutation$MyMutation(this, (i) => i);
}

abstract class CopyWith$Mutation$MyMutation<TRes> {
  factory CopyWith$Mutation$MyMutation(
    Mutation$MyMutation instance,
    TRes Function(Mutation$MyMutation) then,
  ) = _CopyWithImpl$Mutation$MyMutation;

  factory CopyWith$Mutation$MyMutation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MyMutation;

  TRes call({
    Mutation$MyMutation$delete_tests_info_staff? delete_tests_info_staff,
    String? $__typename,
  });
  CopyWith$Mutation$MyMutation$delete_tests_info_staff<TRes>
  get delete_tests_info_staff;
}

class _CopyWithImpl$Mutation$MyMutation<TRes>
    implements CopyWith$Mutation$MyMutation<TRes> {
  _CopyWithImpl$Mutation$MyMutation(this._instance, this._then);

  final Mutation$MyMutation _instance;

  final TRes Function(Mutation$MyMutation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? delete_tests_info_staff = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$MyMutation(
      delete_tests_info_staff: delete_tests_info_staff == _undefined
          ? _instance.delete_tests_info_staff
          : (delete_tests_info_staff
                as Mutation$MyMutation$delete_tests_info_staff?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$MyMutation$delete_tests_info_staff<TRes>
  get delete_tests_info_staff {
    final local$delete_tests_info_staff = _instance.delete_tests_info_staff;
    return local$delete_tests_info_staff == null
        ? CopyWith$Mutation$MyMutation$delete_tests_info_staff.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$MyMutation$delete_tests_info_staff(
            local$delete_tests_info_staff,
            (e) => call(delete_tests_info_staff: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$MyMutation<TRes>
    implements CopyWith$Mutation$MyMutation<TRes> {
  _CopyWithStubImpl$Mutation$MyMutation(this._res);

  TRes _res;

  call({
    Mutation$MyMutation$delete_tests_info_staff? delete_tests_info_staff,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$MyMutation$delete_tests_info_staff<TRes>
  get delete_tests_info_staff =>
      CopyWith$Mutation$MyMutation$delete_tests_info_staff.stub(_res);
}

const documentNodeMutationMyMutation = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MyMutation'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'delete_tests_info_staff'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'where'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: '_and'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'info_staff_id'),
                            value: ObjectValueNode(
                              fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: StringValueNode(
                                    value: '',
                                    isBlock: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'affected_rows'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'returning'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'code'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'info_company_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'info_office_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'info_staff_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'kana'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'phone'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'private_phone'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'remarks'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'remove'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'revision'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'sex'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);

class Mutation$MyMutation$delete_tests_info_staff {
  Mutation$MyMutation$delete_tests_info_staff({
    required this.affected_rows,
    required this.returning,
    this.$__typename = 'tests_info_staff_mutation_response',
  });

  factory Mutation$MyMutation$delete_tests_info_staff.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$affected_rows = json['affected_rows'];
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$MyMutation$delete_tests_info_staff(
      affected_rows: (l$affected_rows as int),
      returning: (l$returning as List<dynamic>)
          .map(
            (e) =>
                Mutation$MyMutation$delete_tests_info_staff$returning.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int affected_rows;

  final List<Mutation$MyMutation$delete_tests_info_staff$returning> returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MyMutation$delete_tests_info_staff ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
      return false;
    }
    final l$returning = returning;
    final lOther$returning = other.returning;
    if (l$returning.length != lOther$returning.length) {
      return false;
    }
    for (int i = 0; i < l$returning.length; i++) {
      final l$returning$entry = l$returning[i];
      final lOther$returning$entry = lOther$returning[i];
      if (l$returning$entry != lOther$returning$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$MyMutation$delete_tests_info_staff
    on Mutation$MyMutation$delete_tests_info_staff {
  CopyWith$Mutation$MyMutation$delete_tests_info_staff<
    Mutation$MyMutation$delete_tests_info_staff
  >
  get copyWith =>
      CopyWith$Mutation$MyMutation$delete_tests_info_staff(this, (i) => i);
}

abstract class CopyWith$Mutation$MyMutation$delete_tests_info_staff<TRes> {
  factory CopyWith$Mutation$MyMutation$delete_tests_info_staff(
    Mutation$MyMutation$delete_tests_info_staff instance,
    TRes Function(Mutation$MyMutation$delete_tests_info_staff) then,
  ) = _CopyWithImpl$Mutation$MyMutation$delete_tests_info_staff;

  factory CopyWith$Mutation$MyMutation$delete_tests_info_staff.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MyMutation$delete_tests_info_staff;

  TRes call({
    int? affected_rows,
    List<Mutation$MyMutation$delete_tests_info_staff$returning>? returning,
    String? $__typename,
  });
  TRes returning(
    Iterable<Mutation$MyMutation$delete_tests_info_staff$returning> Function(
      Iterable<
        CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning<
          Mutation$MyMutation$delete_tests_info_staff$returning
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$MyMutation$delete_tests_info_staff<TRes>
    implements CopyWith$Mutation$MyMutation$delete_tests_info_staff<TRes> {
  _CopyWithImpl$Mutation$MyMutation$delete_tests_info_staff(
    this._instance,
    this._then,
  );

  final Mutation$MyMutation$delete_tests_info_staff _instance;

  final TRes Function(Mutation$MyMutation$delete_tests_info_staff) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? affected_rows = _undefined,
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$MyMutation$delete_tests_info_staff(
      affected_rows: affected_rows == _undefined || affected_rows == null
          ? _instance.affected_rows
          : (affected_rows as int),
      returning: returning == _undefined || returning == null
          ? _instance.returning
          : (returning
                as List<Mutation$MyMutation$delete_tests_info_staff$returning>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes returning(
    Iterable<Mutation$MyMutation$delete_tests_info_staff$returning> Function(
      Iterable<
        CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning<
          Mutation$MyMutation$delete_tests_info_staff$returning
        >
      >,
    )
    _fn,
  ) => call(
    returning: _fn(
      _instance.returning.map(
        (e) => CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Mutation$MyMutation$delete_tests_info_staff<TRes>
    implements CopyWith$Mutation$MyMutation$delete_tests_info_staff<TRes> {
  _CopyWithStubImpl$Mutation$MyMutation$delete_tests_info_staff(this._res);

  TRes _res;

  call({
    int? affected_rows,
    List<Mutation$MyMutation$delete_tests_info_staff$returning>? returning,
    String? $__typename,
  }) => _res;

  returning(_fn) => _res;
}

class Mutation$MyMutation$delete_tests_info_staff$returning {
  Mutation$MyMutation$delete_tests_info_staff$returning({
    this.code,
    this.info_company_id,
    this.info_office_id,
    required this.info_staff_id,
    this.kana,
    required this.name,
    this.phone,
    this.private_phone,
    this.remarks,
    this.remove,
    this.revision,
    this.sex,
    this.$__typename = 'tests_info_staff',
  });

  factory Mutation$MyMutation$delete_tests_info_staff$returning.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$code = json['code'];
    final l$info_company_id = json['info_company_id'];
    final l$info_office_id = json['info_office_id'];
    final l$info_staff_id = json['info_staff_id'];
    final l$kana = json['kana'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$private_phone = json['private_phone'];
    final l$remarks = json['remarks'];
    final l$remove = json['remove'];
    final l$revision = json['revision'];
    final l$sex = json['sex'];
    final l$$__typename = json['__typename'];
    return Mutation$MyMutation$delete_tests_info_staff$returning(
      code: (l$code as String?),
      info_company_id: (l$info_company_id as String?),
      info_office_id: (l$info_office_id as String?),
      info_staff_id: (l$info_staff_id as String),
      kana: (l$kana as String?),
      name: (l$name as String),
      phone: (l$phone as String?),
      private_phone: (l$private_phone as String?),
      remarks: (l$remarks as String?),
      remove: (l$remove as bool?),
      revision: (l$revision as int?),
      sex: (l$sex as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? code;

  final String? info_company_id;

  final String? info_office_id;

  final String info_staff_id;

  final String? kana;

  final String name;

  final String? phone;

  final String? private_phone;

  final String? remarks;

  final bool? remove;

  final int? revision;

  final String? sex;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$info_company_id = info_company_id;
    _resultData['info_company_id'] = l$info_company_id;
    final l$info_office_id = info_office_id;
    _resultData['info_office_id'] = l$info_office_id;
    final l$info_staff_id = info_staff_id;
    _resultData['info_staff_id'] = l$info_staff_id;
    final l$kana = kana;
    _resultData['kana'] = l$kana;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$private_phone = private_phone;
    _resultData['private_phone'] = l$private_phone;
    final l$remarks = remarks;
    _resultData['remarks'] = l$remarks;
    final l$remove = remove;
    _resultData['remove'] = l$remove;
    final l$revision = revision;
    _resultData['revision'] = l$revision;
    final l$sex = sex;
    _resultData['sex'] = l$sex;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$info_company_id = info_company_id;
    final l$info_office_id = info_office_id;
    final l$info_staff_id = info_staff_id;
    final l$kana = kana;
    final l$name = name;
    final l$phone = phone;
    final l$private_phone = private_phone;
    final l$remarks = remarks;
    final l$remove = remove;
    final l$revision = revision;
    final l$sex = sex;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$info_company_id,
      l$info_office_id,
      l$info_staff_id,
      l$kana,
      l$name,
      l$phone,
      l$private_phone,
      l$remarks,
      l$remove,
      l$revision,
      l$sex,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MyMutation$delete_tests_info_staff$returning ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    final l$info_company_id = info_company_id;
    final lOther$info_company_id = other.info_company_id;
    if (l$info_company_id != lOther$info_company_id) {
      return false;
    }
    final l$info_office_id = info_office_id;
    final lOther$info_office_id = other.info_office_id;
    if (l$info_office_id != lOther$info_office_id) {
      return false;
    }
    final l$info_staff_id = info_staff_id;
    final lOther$info_staff_id = other.info_staff_id;
    if (l$info_staff_id != lOther$info_staff_id) {
      return false;
    }
    final l$kana = kana;
    final lOther$kana = other.kana;
    if (l$kana != lOther$kana) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$private_phone = private_phone;
    final lOther$private_phone = other.private_phone;
    if (l$private_phone != lOther$private_phone) {
      return false;
    }
    final l$remarks = remarks;
    final lOther$remarks = other.remarks;
    if (l$remarks != lOther$remarks) {
      return false;
    }
    final l$remove = remove;
    final lOther$remove = other.remove;
    if (l$remove != lOther$remove) {
      return false;
    }
    final l$revision = revision;
    final lOther$revision = other.revision;
    if (l$revision != lOther$revision) {
      return false;
    }
    final l$sex = sex;
    final lOther$sex = other.sex;
    if (l$sex != lOther$sex) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$MyMutation$delete_tests_info_staff$returning
    on Mutation$MyMutation$delete_tests_info_staff$returning {
  CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning<
    Mutation$MyMutation$delete_tests_info_staff$returning
  >
  get copyWith =>
      CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning<
  TRes
> {
  factory CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning(
    Mutation$MyMutation$delete_tests_info_staff$returning instance,
    TRes Function(Mutation$MyMutation$delete_tests_info_staff$returning) then,
  ) = _CopyWithImpl$Mutation$MyMutation$delete_tests_info_staff$returning;

  factory CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$MyMutation$delete_tests_info_staff$returning;

  TRes call({
    String? code,
    String? info_company_id,
    String? info_office_id,
    String? info_staff_id,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    int? revision,
    String? sex,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$MyMutation$delete_tests_info_staff$returning<TRes>
    implements
        CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning<TRes> {
  _CopyWithImpl$Mutation$MyMutation$delete_tests_info_staff$returning(
    this._instance,
    this._then,
  );

  final Mutation$MyMutation$delete_tests_info_staff$returning _instance;

  final TRes Function(Mutation$MyMutation$delete_tests_info_staff$returning)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? info_company_id = _undefined,
    Object? info_office_id = _undefined,
    Object? info_staff_id = _undefined,
    Object? kana = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? private_phone = _undefined,
    Object? remarks = _undefined,
    Object? remove = _undefined,
    Object? revision = _undefined,
    Object? sex = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$MyMutation$delete_tests_info_staff$returning(
      code: code == _undefined ? _instance.code : (code as String?),
      info_company_id: info_company_id == _undefined
          ? _instance.info_company_id
          : (info_company_id as String?),
      info_office_id: info_office_id == _undefined
          ? _instance.info_office_id
          : (info_office_id as String?),
      info_staff_id: info_staff_id == _undefined || info_staff_id == null
          ? _instance.info_staff_id
          : (info_staff_id as String),
      kana: kana == _undefined ? _instance.kana : (kana as String?),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      phone: phone == _undefined ? _instance.phone : (phone as String?),
      private_phone: private_phone == _undefined
          ? _instance.private_phone
          : (private_phone as String?),
      remarks: remarks == _undefined ? _instance.remarks : (remarks as String?),
      remove: remove == _undefined ? _instance.remove : (remove as bool?),
      revision: revision == _undefined
          ? _instance.revision
          : (revision as int?),
      sex: sex == _undefined ? _instance.sex : (sex as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$MyMutation$delete_tests_info_staff$returning<
  TRes
>
    implements
        CopyWith$Mutation$MyMutation$delete_tests_info_staff$returning<TRes> {
  _CopyWithStubImpl$Mutation$MyMutation$delete_tests_info_staff$returning(
    this._res,
  );

  TRes _res;

  call({
    String? code,
    String? info_company_id,
    String? info_office_id,
    String? info_staff_id,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    int? revision,
    String? sex,
    String? $__typename,
  }) => _res;
}
