import 'package:gql/ast.dart';

class Query$StaffQuery {
  Query$StaffQuery({
    required this.tests_info_staff,
    required this.tests_info_staff_aggregate,
    this.$__typename = 'query_root',
  });

  factory Query$StaffQuery.fromJson(Map<String, dynamic> json) {
    final l$tests_info_staff = json['tests_info_staff'];
    final l$tests_info_staff_aggregate = json['tests_info_staff_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$StaffQuery(
      tests_info_staff: (l$tests_info_staff as List<dynamic>)
          .map(
            (e) => Query$StaffQuery$tests_info_staff.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      tests_info_staff_aggregate:
          Query$StaffQuery$tests_info_staff_aggregate.fromJson(
            (l$tests_info_staff_aggregate as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$StaffQuery$tests_info_staff> tests_info_staff;

  final Query$StaffQuery$tests_info_staff_aggregate tests_info_staff_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$tests_info_staff = tests_info_staff;
    _resultData['tests_info_staff'] = l$tests_info_staff
        .map((e) => e.toJson())
        .toList();
    final l$tests_info_staff_aggregate = tests_info_staff_aggregate;
    _resultData['tests_info_staff_aggregate'] = l$tests_info_staff_aggregate
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$tests_info_staff = tests_info_staff;
    final l$tests_info_staff_aggregate = tests_info_staff_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$tests_info_staff.map((v) => v)),
      l$tests_info_staff_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$StaffQuery || runtimeType != other.runtimeType) {
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
    final l$tests_info_staff_aggregate = tests_info_staff_aggregate;
    final lOther$tests_info_staff_aggregate = other.tests_info_staff_aggregate;
    if (l$tests_info_staff_aggregate != lOther$tests_info_staff_aggregate) {
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

extension UtilityExtension$Query$StaffQuery on Query$StaffQuery {
  CopyWith$Query$StaffQuery<Query$StaffQuery> get copyWith =>
      CopyWith$Query$StaffQuery(this, (i) => i);
}

abstract class CopyWith$Query$StaffQuery<TRes> {
  factory CopyWith$Query$StaffQuery(
    Query$StaffQuery instance,
    TRes Function(Query$StaffQuery) then,
  ) = _CopyWithImpl$Query$StaffQuery;

  factory CopyWith$Query$StaffQuery.stub(TRes res) =
      _CopyWithStubImpl$Query$StaffQuery;

  TRes call({
    List<Query$StaffQuery$tests_info_staff>? tests_info_staff,
    Query$StaffQuery$tests_info_staff_aggregate? tests_info_staff_aggregate,
    String? $__typename,
  });
  TRes tests_info_staff(
    Iterable<Query$StaffQuery$tests_info_staff> Function(
      Iterable<
        CopyWith$Query$StaffQuery$tests_info_staff<
          Query$StaffQuery$tests_info_staff
        >
      >,
    )
    _fn,
  );
  CopyWith$Query$StaffQuery$tests_info_staff_aggregate<TRes>
  get tests_info_staff_aggregate;
}

class _CopyWithImpl$Query$StaffQuery<TRes>
    implements CopyWith$Query$StaffQuery<TRes> {
  _CopyWithImpl$Query$StaffQuery(this._instance, this._then);

  final Query$StaffQuery _instance;

  final TRes Function(Query$StaffQuery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tests_info_staff = _undefined,
    Object? tests_info_staff_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$StaffQuery(
      tests_info_staff:
          tests_info_staff == _undefined || tests_info_staff == null
          ? _instance.tests_info_staff
          : (tests_info_staff as List<Query$StaffQuery$tests_info_staff>),
      tests_info_staff_aggregate:
          tests_info_staff_aggregate == _undefined ||
              tests_info_staff_aggregate == null
          ? _instance.tests_info_staff_aggregate
          : (tests_info_staff_aggregate
                as Query$StaffQuery$tests_info_staff_aggregate),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes tests_info_staff(
    Iterable<Query$StaffQuery$tests_info_staff> Function(
      Iterable<
        CopyWith$Query$StaffQuery$tests_info_staff<
          Query$StaffQuery$tests_info_staff
        >
      >,
    )
    _fn,
  ) => call(
    tests_info_staff: _fn(
      _instance.tests_info_staff.map(
        (e) => CopyWith$Query$StaffQuery$tests_info_staff(e, (i) => i),
      ),
    ).toList(),
  );

  CopyWith$Query$StaffQuery$tests_info_staff_aggregate<TRes>
  get tests_info_staff_aggregate {
    final local$tests_info_staff_aggregate =
        _instance.tests_info_staff_aggregate;
    return CopyWith$Query$StaffQuery$tests_info_staff_aggregate(
      local$tests_info_staff_aggregate,
      (e) => call(tests_info_staff_aggregate: e),
    );
  }
}

class _CopyWithStubImpl$Query$StaffQuery<TRes>
    implements CopyWith$Query$StaffQuery<TRes> {
  _CopyWithStubImpl$Query$StaffQuery(this._res);

  TRes _res;

  call({
    List<Query$StaffQuery$tests_info_staff>? tests_info_staff,
    Query$StaffQuery$tests_info_staff_aggregate? tests_info_staff_aggregate,
    String? $__typename,
  }) => _res;

  tests_info_staff(_fn) => _res;

  CopyWith$Query$StaffQuery$tests_info_staff_aggregate<TRes>
  get tests_info_staff_aggregate =>
      CopyWith$Query$StaffQuery$tests_info_staff_aggregate.stub(_res);
}

const documentNodeQueryStaffQuery = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'StaffQuery'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'tests_info_staff'),
            alias: null,
            arguments: [
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
                  name: NameNode(value: 'remarks'),
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
            name: NameNode(value: 'tests_info_staff_aggregate'),
            alias: null,
            arguments: [
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
                  name: NameNode(value: 'aggregate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'count'),
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

class Query$StaffQuery$tests_info_staff {
  Query$StaffQuery$tests_info_staff({
    this.code,
    this.kana,
    required this.name,
    this.phone,
    this.private_phone,
    this.remove,
    this.revision,
    this.sex,
    this.update_at,
    this.update_user_history_id,
    this.update_user_id,
    this.remarks,
    this.$__typename = 'tests_info_staff',
  });

  factory Query$StaffQuery$tests_info_staff.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$code = json['code'];
    final l$kana = json['kana'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$private_phone = json['private_phone'];
    final l$remove = json['remove'];
    final l$revision = json['revision'];
    final l$sex = json['sex'];
    final l$update_at = json['update_at'];
    final l$update_user_history_id = json['update_user_history_id'];
    final l$update_user_id = json['update_user_id'];
    final l$remarks = json['remarks'];
    final l$$__typename = json['__typename'];
    return Query$StaffQuery$tests_info_staff(
      code: (l$code as String?),
      kana: (l$kana as String?),
      name: (l$name as String),
      phone: (l$phone as String?),
      private_phone: (l$private_phone as String?),
      remove: (l$remove as bool?),
      revision: (l$revision as int?),
      sex: (l$sex as String?),
      update_at: (l$update_at as String?),
      update_user_history_id: (l$update_user_history_id as String?),
      update_user_id: (l$update_user_id as String?),
      remarks: (l$remarks as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? code;

  final String? kana;

  final String name;

  final String? phone;

  final String? private_phone;

  final bool? remove;

  final int? revision;

  final String? sex;

  final String? update_at;

  final String? update_user_history_id;

  final String? update_user_id;

  final String? remarks;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$kana = kana;
    _resultData['kana'] = l$kana;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$private_phone = private_phone;
    _resultData['private_phone'] = l$private_phone;
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
    final l$remarks = remarks;
    _resultData['remarks'] = l$remarks;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$kana = kana;
    final l$name = name;
    final l$phone = phone;
    final l$private_phone = private_phone;
    final l$remove = remove;
    final l$revision = revision;
    final l$sex = sex;
    final l$update_at = update_at;
    final l$update_user_history_id = update_user_history_id;
    final l$update_user_id = update_user_id;
    final l$remarks = remarks;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$kana,
      l$name,
      l$phone,
      l$private_phone,
      l$remove,
      l$revision,
      l$sex,
      l$update_at,
      l$update_user_history_id,
      l$update_user_id,
      l$remarks,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$StaffQuery$tests_info_staff ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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
    final l$remarks = remarks;
    final lOther$remarks = other.remarks;
    if (l$remarks != lOther$remarks) {
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

extension UtilityExtension$Query$StaffQuery$tests_info_staff
    on Query$StaffQuery$tests_info_staff {
  CopyWith$Query$StaffQuery$tests_info_staff<Query$StaffQuery$tests_info_staff>
  get copyWith => CopyWith$Query$StaffQuery$tests_info_staff(this, (i) => i);
}

abstract class CopyWith$Query$StaffQuery$tests_info_staff<TRes> {
  factory CopyWith$Query$StaffQuery$tests_info_staff(
    Query$StaffQuery$tests_info_staff instance,
    TRes Function(Query$StaffQuery$tests_info_staff) then,
  ) = _CopyWithImpl$Query$StaffQuery$tests_info_staff;

  factory CopyWith$Query$StaffQuery$tests_info_staff.stub(TRes res) =
      _CopyWithStubImpl$Query$StaffQuery$tests_info_staff;

  TRes call({
    String? code,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    bool? remove,
    int? revision,
    String? sex,
    String? update_at,
    String? update_user_history_id,
    String? update_user_id,
    String? remarks,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$StaffQuery$tests_info_staff<TRes>
    implements CopyWith$Query$StaffQuery$tests_info_staff<TRes> {
  _CopyWithImpl$Query$StaffQuery$tests_info_staff(this._instance, this._then);

  final Query$StaffQuery$tests_info_staff _instance;

  final TRes Function(Query$StaffQuery$tests_info_staff) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? kana = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? private_phone = _undefined,
    Object? remove = _undefined,
    Object? revision = _undefined,
    Object? sex = _undefined,
    Object? update_at = _undefined,
    Object? update_user_history_id = _undefined,
    Object? update_user_id = _undefined,
    Object? remarks = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$StaffQuery$tests_info_staff(
      code: code == _undefined ? _instance.code : (code as String?),
      kana: kana == _undefined ? _instance.kana : (kana as String?),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      phone: phone == _undefined ? _instance.phone : (phone as String?),
      private_phone: private_phone == _undefined
          ? _instance.private_phone
          : (private_phone as String?),
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
      remarks: remarks == _undefined ? _instance.remarks : (remarks as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$StaffQuery$tests_info_staff<TRes>
    implements CopyWith$Query$StaffQuery$tests_info_staff<TRes> {
  _CopyWithStubImpl$Query$StaffQuery$tests_info_staff(this._res);

  TRes _res;

  call({
    String? code,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    bool? remove,
    int? revision,
    String? sex,
    String? update_at,
    String? update_user_history_id,
    String? update_user_id,
    String? remarks,
    String? $__typename,
  }) => _res;
}

class Query$StaffQuery$tests_info_staff_aggregate {
  Query$StaffQuery$tests_info_staff_aggregate({
    this.aggregate,
    this.$__typename = 'tests_info_staff_aggregate',
  });

  factory Query$StaffQuery$tests_info_staff_aggregate.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$StaffQuery$tests_info_staff_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$StaffQuery$tests_info_staff_aggregate$aggregate.fromJson(
              (l$aggregate as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$StaffQuery$tests_info_staff_aggregate$aggregate? aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$aggregate = aggregate;
    _resultData['aggregate'] = l$aggregate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$aggregate = aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([l$aggregate, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$StaffQuery$tests_info_staff_aggregate ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$aggregate = aggregate;
    final lOther$aggregate = other.aggregate;
    if (l$aggregate != lOther$aggregate) {
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

extension UtilityExtension$Query$StaffQuery$tests_info_staff_aggregate
    on Query$StaffQuery$tests_info_staff_aggregate {
  CopyWith$Query$StaffQuery$tests_info_staff_aggregate<
    Query$StaffQuery$tests_info_staff_aggregate
  >
  get copyWith =>
      CopyWith$Query$StaffQuery$tests_info_staff_aggregate(this, (i) => i);
}

abstract class CopyWith$Query$StaffQuery$tests_info_staff_aggregate<TRes> {
  factory CopyWith$Query$StaffQuery$tests_info_staff_aggregate(
    Query$StaffQuery$tests_info_staff_aggregate instance,
    TRes Function(Query$StaffQuery$tests_info_staff_aggregate) then,
  ) = _CopyWithImpl$Query$StaffQuery$tests_info_staff_aggregate;

  factory CopyWith$Query$StaffQuery$tests_info_staff_aggregate.stub(TRes res) =
      _CopyWithStubImpl$Query$StaffQuery$tests_info_staff_aggregate;

  TRes call({
    Query$StaffQuery$tests_info_staff_aggregate$aggregate? aggregate,
    String? $__typename,
  });
  CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate<TRes>
  get aggregate;
}

class _CopyWithImpl$Query$StaffQuery$tests_info_staff_aggregate<TRes>
    implements CopyWith$Query$StaffQuery$tests_info_staff_aggregate<TRes> {
  _CopyWithImpl$Query$StaffQuery$tests_info_staff_aggregate(
    this._instance,
    this._then,
  );

  final Query$StaffQuery$tests_info_staff_aggregate _instance;

  final TRes Function(Query$StaffQuery$tests_info_staff_aggregate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$StaffQuery$tests_info_staff_aggregate(
      aggregate: aggregate == _undefined
          ? _instance.aggregate
          : (aggregate
                as Query$StaffQuery$tests_info_staff_aggregate$aggregate?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate<TRes>
  get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate.stub(
            _then(_instance),
          )
        : CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate(
            local$aggregate,
            (e) => call(aggregate: e),
          );
  }
}

class _CopyWithStubImpl$Query$StaffQuery$tests_info_staff_aggregate<TRes>
    implements CopyWith$Query$StaffQuery$tests_info_staff_aggregate<TRes> {
  _CopyWithStubImpl$Query$StaffQuery$tests_info_staff_aggregate(this._res);

  TRes _res;

  call({
    Query$StaffQuery$tests_info_staff_aggregate$aggregate? aggregate,
    String? $__typename,
  }) => _res;

  CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate<TRes>
  get aggregate =>
      CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate.stub(_res);
}

class Query$StaffQuery$tests_info_staff_aggregate$aggregate {
  Query$StaffQuery$tests_info_staff_aggregate$aggregate({
    required this.count,
    this.$__typename = 'tests_info_staff_aggregate_fields',
  });

  factory Query$StaffQuery$tests_info_staff_aggregate$aggregate.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$StaffQuery$tests_info_staff_aggregate$aggregate(
      count: (l$count as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([l$count, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$StaffQuery$tests_info_staff_aggregate$aggregate ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
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

extension UtilityExtension$Query$StaffQuery$tests_info_staff_aggregate$aggregate
    on Query$StaffQuery$tests_info_staff_aggregate$aggregate {
  CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate<
    Query$StaffQuery$tests_info_staff_aggregate$aggregate
  >
  get copyWith =>
      CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate<
  TRes
> {
  factory CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate(
    Query$StaffQuery$tests_info_staff_aggregate$aggregate instance,
    TRes Function(Query$StaffQuery$tests_info_staff_aggregate$aggregate) then,
  ) = _CopyWithImpl$Query$StaffQuery$tests_info_staff_aggregate$aggregate;

  factory CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$StaffQuery$tests_info_staff_aggregate$aggregate;

  TRes call({int? count, String? $__typename});
}

class _CopyWithImpl$Query$StaffQuery$tests_info_staff_aggregate$aggregate<TRes>
    implements
        CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate<TRes> {
  _CopyWithImpl$Query$StaffQuery$tests_info_staff_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$StaffQuery$tests_info_staff_aggregate$aggregate _instance;

  final TRes Function(Query$StaffQuery$tests_info_staff_aggregate$aggregate)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? count = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$StaffQuery$tests_info_staff_aggregate$aggregate(
          count: count == _undefined || count == null
              ? _instance.count
              : (count as int),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Query$StaffQuery$tests_info_staff_aggregate$aggregate<
  TRes
>
    implements
        CopyWith$Query$StaffQuery$tests_info_staff_aggregate$aggregate<TRes> {
  _CopyWithStubImpl$Query$StaffQuery$tests_info_staff_aggregate$aggregate(
    this._res,
  );

  TRes _res;

  call({int? count, String? $__typename}) => _res;
}

class Mutation$StaffEdit {
  Mutation$StaffEdit({
    this.insert_tests_info_staff,
    this.update_tests_info_staff,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$StaffEdit.fromJson(Map<String, dynamic> json) {
    final l$insert_tests_info_staff = json['insert_tests_info_staff'];
    final l$update_tests_info_staff = json['update_tests_info_staff'];
    final l$$__typename = json['__typename'];
    return Mutation$StaffEdit(
      insert_tests_info_staff: l$insert_tests_info_staff == null
          ? null
          : Mutation$StaffEdit$insert_tests_info_staff.fromJson(
              (l$insert_tests_info_staff as Map<String, dynamic>),
            ),
      update_tests_info_staff: l$update_tests_info_staff == null
          ? null
          : Mutation$StaffEdit$update_tests_info_staff.fromJson(
              (l$update_tests_info_staff as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$StaffEdit$insert_tests_info_staff? insert_tests_info_staff;

  final Mutation$StaffEdit$update_tests_info_staff? update_tests_info_staff;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_tests_info_staff = insert_tests_info_staff;
    _resultData['insert_tests_info_staff'] = l$insert_tests_info_staff
        ?.toJson();
    final l$update_tests_info_staff = update_tests_info_staff;
    _resultData['update_tests_info_staff'] = l$update_tests_info_staff
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_tests_info_staff = insert_tests_info_staff;
    final l$update_tests_info_staff = update_tests_info_staff;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_tests_info_staff,
      l$update_tests_info_staff,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$StaffEdit || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_tests_info_staff = insert_tests_info_staff;
    final lOther$insert_tests_info_staff = other.insert_tests_info_staff;
    if (l$insert_tests_info_staff != lOther$insert_tests_info_staff) {
      return false;
    }
    final l$update_tests_info_staff = update_tests_info_staff;
    final lOther$update_tests_info_staff = other.update_tests_info_staff;
    if (l$update_tests_info_staff != lOther$update_tests_info_staff) {
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

extension UtilityExtension$Mutation$StaffEdit on Mutation$StaffEdit {
  CopyWith$Mutation$StaffEdit<Mutation$StaffEdit> get copyWith =>
      CopyWith$Mutation$StaffEdit(this, (i) => i);
}

abstract class CopyWith$Mutation$StaffEdit<TRes> {
  factory CopyWith$Mutation$StaffEdit(
    Mutation$StaffEdit instance,
    TRes Function(Mutation$StaffEdit) then,
  ) = _CopyWithImpl$Mutation$StaffEdit;

  factory CopyWith$Mutation$StaffEdit.stub(TRes res) =
      _CopyWithStubImpl$Mutation$StaffEdit;

  TRes call({
    Mutation$StaffEdit$insert_tests_info_staff? insert_tests_info_staff,
    Mutation$StaffEdit$update_tests_info_staff? update_tests_info_staff,
    String? $__typename,
  });
  CopyWith$Mutation$StaffEdit$insert_tests_info_staff<TRes>
  get insert_tests_info_staff;
  CopyWith$Mutation$StaffEdit$update_tests_info_staff<TRes>
  get update_tests_info_staff;
}

class _CopyWithImpl$Mutation$StaffEdit<TRes>
    implements CopyWith$Mutation$StaffEdit<TRes> {
  _CopyWithImpl$Mutation$StaffEdit(this._instance, this._then);

  final Mutation$StaffEdit _instance;

  final TRes Function(Mutation$StaffEdit) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_tests_info_staff = _undefined,
    Object? update_tests_info_staff = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$StaffEdit(
      insert_tests_info_staff: insert_tests_info_staff == _undefined
          ? _instance.insert_tests_info_staff
          : (insert_tests_info_staff
                as Mutation$StaffEdit$insert_tests_info_staff?),
      update_tests_info_staff: update_tests_info_staff == _undefined
          ? _instance.update_tests_info_staff
          : (update_tests_info_staff
                as Mutation$StaffEdit$update_tests_info_staff?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$StaffEdit$insert_tests_info_staff<TRes>
  get insert_tests_info_staff {
    final local$insert_tests_info_staff = _instance.insert_tests_info_staff;
    return local$insert_tests_info_staff == null
        ? CopyWith$Mutation$StaffEdit$insert_tests_info_staff.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$StaffEdit$insert_tests_info_staff(
            local$insert_tests_info_staff,
            (e) => call(insert_tests_info_staff: e),
          );
  }

  CopyWith$Mutation$StaffEdit$update_tests_info_staff<TRes>
  get update_tests_info_staff {
    final local$update_tests_info_staff = _instance.update_tests_info_staff;
    return local$update_tests_info_staff == null
        ? CopyWith$Mutation$StaffEdit$update_tests_info_staff.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$StaffEdit$update_tests_info_staff(
            local$update_tests_info_staff,
            (e) => call(update_tests_info_staff: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$StaffEdit<TRes>
    implements CopyWith$Mutation$StaffEdit<TRes> {
  _CopyWithStubImpl$Mutation$StaffEdit(this._res);

  TRes _res;

  call({
    Mutation$StaffEdit$insert_tests_info_staff? insert_tests_info_staff,
    Mutation$StaffEdit$update_tests_info_staff? update_tests_info_staff,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$StaffEdit$insert_tests_info_staff<TRes>
  get insert_tests_info_staff =>
      CopyWith$Mutation$StaffEdit$insert_tests_info_staff.stub(_res);

  CopyWith$Mutation$StaffEdit$update_tests_info_staff<TRes>
  get update_tests_info_staff =>
      CopyWith$Mutation$StaffEdit$update_tests_info_staff.stub(_res);
}

const documentNodeMutationStaffEdit = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'StaffEdit'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'insert_tests_info_staff'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objects'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'code'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'kana'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'name'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'phone'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'private_phone'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'remarks'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'remove'),
                      value: BooleanValueNode(value: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'sex'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'update_user_history_id'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'update_user_id'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                  ],
                ),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
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
            name: NameNode(value: 'update_tests_info_staff'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: '_set'),
                value: ObjectValueNode(
                  fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'kana'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'name'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'phone'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'private_phone'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'remarks'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'remove'),
                      value: BooleanValueNode(value: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'sex'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'update_user_history_id'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                    ObjectFieldNode(
                      name: NameNode(value: 'update_user_id'),
                      value: StringValueNode(value: '', isBlock: false),
                    ),
                  ],
                ),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
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

class Mutation$StaffEdit$insert_tests_info_staff {
  Mutation$StaffEdit$insert_tests_info_staff({
    required this.returning,
    this.$__typename = 'tests_info_staff_mutation_response',
  });

  factory Mutation$StaffEdit$insert_tests_info_staff.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$StaffEdit$insert_tests_info_staff(
      returning: (l$returning as List<dynamic>)
          .map(
            (e) =>
                Mutation$StaffEdit$insert_tests_info_staff$returning.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$StaffEdit$insert_tests_info_staff$returning> returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$StaffEdit$insert_tests_info_staff ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$StaffEdit$insert_tests_info_staff
    on Mutation$StaffEdit$insert_tests_info_staff {
  CopyWith$Mutation$StaffEdit$insert_tests_info_staff<
    Mutation$StaffEdit$insert_tests_info_staff
  >
  get copyWith =>
      CopyWith$Mutation$StaffEdit$insert_tests_info_staff(this, (i) => i);
}

abstract class CopyWith$Mutation$StaffEdit$insert_tests_info_staff<TRes> {
  factory CopyWith$Mutation$StaffEdit$insert_tests_info_staff(
    Mutation$StaffEdit$insert_tests_info_staff instance,
    TRes Function(Mutation$StaffEdit$insert_tests_info_staff) then,
  ) = _CopyWithImpl$Mutation$StaffEdit$insert_tests_info_staff;

  factory CopyWith$Mutation$StaffEdit$insert_tests_info_staff.stub(TRes res) =
      _CopyWithStubImpl$Mutation$StaffEdit$insert_tests_info_staff;

  TRes call({
    List<Mutation$StaffEdit$insert_tests_info_staff$returning>? returning,
    String? $__typename,
  });
  TRes returning(
    Iterable<Mutation$StaffEdit$insert_tests_info_staff$returning> Function(
      Iterable<
        CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning<
          Mutation$StaffEdit$insert_tests_info_staff$returning
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$StaffEdit$insert_tests_info_staff<TRes>
    implements CopyWith$Mutation$StaffEdit$insert_tests_info_staff<TRes> {
  _CopyWithImpl$Mutation$StaffEdit$insert_tests_info_staff(
    this._instance,
    this._then,
  );

  final Mutation$StaffEdit$insert_tests_info_staff _instance;

  final TRes Function(Mutation$StaffEdit$insert_tests_info_staff) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$StaffEdit$insert_tests_info_staff(
      returning: returning == _undefined || returning == null
          ? _instance.returning
          : (returning
                as List<Mutation$StaffEdit$insert_tests_info_staff$returning>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes returning(
    Iterable<Mutation$StaffEdit$insert_tests_info_staff$returning> Function(
      Iterable<
        CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning<
          Mutation$StaffEdit$insert_tests_info_staff$returning
        >
      >,
    )
    _fn,
  ) => call(
    returning: _fn(
      _instance.returning.map(
        (e) => CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Mutation$StaffEdit$insert_tests_info_staff<TRes>
    implements CopyWith$Mutation$StaffEdit$insert_tests_info_staff<TRes> {
  _CopyWithStubImpl$Mutation$StaffEdit$insert_tests_info_staff(this._res);

  TRes _res;

  call({
    List<Mutation$StaffEdit$insert_tests_info_staff$returning>? returning,
    String? $__typename,
  }) => _res;

  returning(_fn) => _res;
}

class Mutation$StaffEdit$insert_tests_info_staff$returning {
  Mutation$StaffEdit$insert_tests_info_staff$returning({
    this.code,
    this.kana,
    required this.name,
    this.phone,
    this.private_phone,
    this.remarks,
    this.remove,
    this.sex,
    this.update_at,
    this.update_user_history_id,
    this.$__typename = 'tests_info_staff',
  });

  factory Mutation$StaffEdit$insert_tests_info_staff$returning.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$code = json['code'];
    final l$kana = json['kana'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$private_phone = json['private_phone'];
    final l$remarks = json['remarks'];
    final l$remove = json['remove'];
    final l$sex = json['sex'];
    final l$update_at = json['update_at'];
    final l$update_user_history_id = json['update_user_history_id'];
    final l$$__typename = json['__typename'];
    return Mutation$StaffEdit$insert_tests_info_staff$returning(
      code: (l$code as String?),
      kana: (l$kana as String?),
      name: (l$name as String),
      phone: (l$phone as String?),
      private_phone: (l$private_phone as String?),
      remarks: (l$remarks as String?),
      remove: (l$remove as bool?),
      sex: (l$sex as String?),
      update_at: (l$update_at as String?),
      update_user_history_id: (l$update_user_history_id as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? code;

  final String? kana;

  final String name;

  final String? phone;

  final String? private_phone;

  final String? remarks;

  final bool? remove;

  final String? sex;

  final String? update_at;

  final String? update_user_history_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
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
    final l$sex = sex;
    _resultData['sex'] = l$sex;
    final l$update_at = update_at;
    _resultData['update_at'] = l$update_at;
    final l$update_user_history_id = update_user_history_id;
    _resultData['update_user_history_id'] = l$update_user_history_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$kana = kana;
    final l$name = name;
    final l$phone = phone;
    final l$private_phone = private_phone;
    final l$remarks = remarks;
    final l$remove = remove;
    final l$sex = sex;
    final l$update_at = update_at;
    final l$update_user_history_id = update_user_history_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$kana,
      l$name,
      l$phone,
      l$private_phone,
      l$remarks,
      l$remove,
      l$sex,
      l$update_at,
      l$update_user_history_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$StaffEdit$insert_tests_info_staff$returning ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$StaffEdit$insert_tests_info_staff$returning
    on Mutation$StaffEdit$insert_tests_info_staff$returning {
  CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning<
    Mutation$StaffEdit$insert_tests_info_staff$returning
  >
  get copyWith => CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning<
  TRes
> {
  factory CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning(
    Mutation$StaffEdit$insert_tests_info_staff$returning instance,
    TRes Function(Mutation$StaffEdit$insert_tests_info_staff$returning) then,
  ) = _CopyWithImpl$Mutation$StaffEdit$insert_tests_info_staff$returning;

  factory CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$StaffEdit$insert_tests_info_staff$returning;

  TRes call({
    String? code,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    String? sex,
    String? update_at,
    String? update_user_history_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$StaffEdit$insert_tests_info_staff$returning<TRes>
    implements
        CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning<TRes> {
  _CopyWithImpl$Mutation$StaffEdit$insert_tests_info_staff$returning(
    this._instance,
    this._then,
  );

  final Mutation$StaffEdit$insert_tests_info_staff$returning _instance;

  final TRes Function(Mutation$StaffEdit$insert_tests_info_staff$returning)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? kana = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? private_phone = _undefined,
    Object? remarks = _undefined,
    Object? remove = _undefined,
    Object? sex = _undefined,
    Object? update_at = _undefined,
    Object? update_user_history_id = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$StaffEdit$insert_tests_info_staff$returning(
      code: code == _undefined ? _instance.code : (code as String?),
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
      sex: sex == _undefined ? _instance.sex : (sex as String?),
      update_at: update_at == _undefined
          ? _instance.update_at
          : (update_at as String?),
      update_user_history_id: update_user_history_id == _undefined
          ? _instance.update_user_history_id
          : (update_user_history_id as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$StaffEdit$insert_tests_info_staff$returning<
  TRes
>
    implements
        CopyWith$Mutation$StaffEdit$insert_tests_info_staff$returning<TRes> {
  _CopyWithStubImpl$Mutation$StaffEdit$insert_tests_info_staff$returning(
    this._res,
  );

  TRes _res;

  call({
    String? code,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    String? sex,
    String? update_at,
    String? update_user_history_id,
    String? $__typename,
  }) => _res;
}

class Mutation$StaffEdit$update_tests_info_staff {
  Mutation$StaffEdit$update_tests_info_staff({
    required this.returning,
    this.$__typename = 'tests_info_staff_mutation_response',
  });

  factory Mutation$StaffEdit$update_tests_info_staff.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$StaffEdit$update_tests_info_staff(
      returning: (l$returning as List<dynamic>)
          .map(
            (e) =>
                Mutation$StaffEdit$update_tests_info_staff$returning.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$StaffEdit$update_tests_info_staff$returning> returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$StaffEdit$update_tests_info_staff ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$StaffEdit$update_tests_info_staff
    on Mutation$StaffEdit$update_tests_info_staff {
  CopyWith$Mutation$StaffEdit$update_tests_info_staff<
    Mutation$StaffEdit$update_tests_info_staff
  >
  get copyWith =>
      CopyWith$Mutation$StaffEdit$update_tests_info_staff(this, (i) => i);
}

abstract class CopyWith$Mutation$StaffEdit$update_tests_info_staff<TRes> {
  factory CopyWith$Mutation$StaffEdit$update_tests_info_staff(
    Mutation$StaffEdit$update_tests_info_staff instance,
    TRes Function(Mutation$StaffEdit$update_tests_info_staff) then,
  ) = _CopyWithImpl$Mutation$StaffEdit$update_tests_info_staff;

  factory CopyWith$Mutation$StaffEdit$update_tests_info_staff.stub(TRes res) =
      _CopyWithStubImpl$Mutation$StaffEdit$update_tests_info_staff;

  TRes call({
    List<Mutation$StaffEdit$update_tests_info_staff$returning>? returning,
    String? $__typename,
  });
  TRes returning(
    Iterable<Mutation$StaffEdit$update_tests_info_staff$returning> Function(
      Iterable<
        CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning<
          Mutation$StaffEdit$update_tests_info_staff$returning
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$StaffEdit$update_tests_info_staff<TRes>
    implements CopyWith$Mutation$StaffEdit$update_tests_info_staff<TRes> {
  _CopyWithImpl$Mutation$StaffEdit$update_tests_info_staff(
    this._instance,
    this._then,
  );

  final Mutation$StaffEdit$update_tests_info_staff _instance;

  final TRes Function(Mutation$StaffEdit$update_tests_info_staff) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$StaffEdit$update_tests_info_staff(
      returning: returning == _undefined || returning == null
          ? _instance.returning
          : (returning
                as List<Mutation$StaffEdit$update_tests_info_staff$returning>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes returning(
    Iterable<Mutation$StaffEdit$update_tests_info_staff$returning> Function(
      Iterable<
        CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning<
          Mutation$StaffEdit$update_tests_info_staff$returning
        >
      >,
    )
    _fn,
  ) => call(
    returning: _fn(
      _instance.returning.map(
        (e) => CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Mutation$StaffEdit$update_tests_info_staff<TRes>
    implements CopyWith$Mutation$StaffEdit$update_tests_info_staff<TRes> {
  _CopyWithStubImpl$Mutation$StaffEdit$update_tests_info_staff(this._res);

  TRes _res;

  call({
    List<Mutation$StaffEdit$update_tests_info_staff$returning>? returning,
    String? $__typename,
  }) => _res;

  returning(_fn) => _res;
}

class Mutation$StaffEdit$update_tests_info_staff$returning {
  Mutation$StaffEdit$update_tests_info_staff$returning({
    this.code,
    this.kana,
    required this.name,
    this.phone,
    this.private_phone,
    this.remarks,
    this.remove,
    this.sex,
    this.$__typename = 'tests_info_staff',
  });

  factory Mutation$StaffEdit$update_tests_info_staff$returning.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$code = json['code'];
    final l$kana = json['kana'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$private_phone = json['private_phone'];
    final l$remarks = json['remarks'];
    final l$remove = json['remove'];
    final l$sex = json['sex'];
    final l$$__typename = json['__typename'];
    return Mutation$StaffEdit$update_tests_info_staff$returning(
      code: (l$code as String?),
      kana: (l$kana as String?),
      name: (l$name as String),
      phone: (l$phone as String?),
      private_phone: (l$private_phone as String?),
      remarks: (l$remarks as String?),
      remove: (l$remove as bool?),
      sex: (l$sex as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? code;

  final String? kana;

  final String name;

  final String? phone;

  final String? private_phone;

  final String? remarks;

  final bool? remove;

  final String? sex;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
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
    final l$sex = sex;
    _resultData['sex'] = l$sex;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$kana = kana;
    final l$name = name;
    final l$phone = phone;
    final l$private_phone = private_phone;
    final l$remarks = remarks;
    final l$remove = remove;
    final l$sex = sex;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$kana,
      l$name,
      l$phone,
      l$private_phone,
      l$remarks,
      l$remove,
      l$sex,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$StaffEdit$update_tests_info_staff$returning ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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

extension UtilityExtension$Mutation$StaffEdit$update_tests_info_staff$returning
    on Mutation$StaffEdit$update_tests_info_staff$returning {
  CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning<
    Mutation$StaffEdit$update_tests_info_staff$returning
  >
  get copyWith => CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning<
  TRes
> {
  factory CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning(
    Mutation$StaffEdit$update_tests_info_staff$returning instance,
    TRes Function(Mutation$StaffEdit$update_tests_info_staff$returning) then,
  ) = _CopyWithImpl$Mutation$StaffEdit$update_tests_info_staff$returning;

  factory CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$StaffEdit$update_tests_info_staff$returning;

  TRes call({
    String? code,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    String? sex,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$StaffEdit$update_tests_info_staff$returning<TRes>
    implements
        CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning<TRes> {
  _CopyWithImpl$Mutation$StaffEdit$update_tests_info_staff$returning(
    this._instance,
    this._then,
  );

  final Mutation$StaffEdit$update_tests_info_staff$returning _instance;

  final TRes Function(Mutation$StaffEdit$update_tests_info_staff$returning)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? kana = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? private_phone = _undefined,
    Object? remarks = _undefined,
    Object? remove = _undefined,
    Object? sex = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$StaffEdit$update_tests_info_staff$returning(
      code: code == _undefined ? _instance.code : (code as String?),
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
      sex: sex == _undefined ? _instance.sex : (sex as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$StaffEdit$update_tests_info_staff$returning<
  TRes
>
    implements
        CopyWith$Mutation$StaffEdit$update_tests_info_staff$returning<TRes> {
  _CopyWithStubImpl$Mutation$StaffEdit$update_tests_info_staff$returning(
    this._res,
  );

  TRes _res;

  call({
    String? code,
    String? kana,
    String? name,
    String? phone,
    String? private_phone,
    String? remarks,
    bool? remove,
    String? sex,
    String? $__typename,
  }) => _res;
}
