import 'package:expression_test/expression_test.dart';
import 'package:expression_test/src/condisiton/expressions/builders/graphql_expression_builder.dart';
import 'package:test/test.dart';

final ansony = {'name': 'Ansony', 'age': 50};
final chery = {'name': 'Chery', 'age': 30};
final denny = {'name': 'Denny', 'age': 20};
final epon = {'name': 'Epon', 'age': 10};
final fourmura = {'name': 'Fourmura', 'age': 6};

final map = <Map<String, dynamic>>[
  ansony,
  {'name': 'Berry', 'age': 40},
  chery,
  denny,
  epon,
];

final age20ValEx = ValueExpression(20, name: 'age20ValEx');
final age40ValEx = ValueExpression(40, name: 'age40ValEx');
final nameRyEx = ValueExpression('ry', name: 'nameRyEx');
final nameEEx = ValueExpression('E', name: 'nameEEx');
final nameoEx = ValueExpression('o', name: 'nameoEx');

final fieleNamedEx = FieldExpression<Map<String, dynamic>>(
  (map) => map['name'],
  name: 'fieleNamedEx',
);
final fieldAgeEx = FieldExpression<Map<String, dynamic>>(
  (map) => map['age'],
  name: 'fieldAgeEx',
);
final nameFieleNamedEx = NameFieldExpression('name', name: 'nameFieleNamedEx');
final nameFieldAgeEx = NameFieldExpression('age', name: 'nameFieldAgeEx');

final eqAge20Ex = EquqleExpression(fieldAgeEx, age20ValEx, name: 'eqAge20Ex');
final notEqAge20Ex = EquqleExpression(
  fieldAgeEx,
  age20ValEx,
  isNot: true,
  name: 'notEqAge20Ex',
);

final eqNameAge20Ex = EquqleExpression(
  nameFieldAgeEx,
  age20ValEx,
  name: 'eqNameAge20Ex',
);
final notNameEqAge20Ex = EquqleExpression(
  nameFieldAgeEx,
  age20ValEx,
  isNot: true,
  name: 'notNameEqAge20Ex',
);

final gtAge20Ex = GreaterExpression(fieldAgeEx, age20ValEx, name: 'gtAge20Ex');
final geAge20Ex = GreaterExpression(
  fieldAgeEx,
  age20ValEx,
  name: 'geAge20Ex',
  isEqulity: true,
);

final gtNameAge20Ex = GreaterExpression(
  nameFieldAgeEx,
  age20ValEx,
  name: 'gtNameAge20Ex',
);
final geNameAge20Ex = GreaterExpression(
  nameFieldAgeEx,
  age20ValEx,
  name: 'geNameAge20Ex',
  isEqulity: true,
);

final listBuilder = ListExpressionBuilder<Map<String, dynamic>>();
final sqlBuilder = SqlExpressionBuilder<Map<String, dynamic>>();
final graphqlBuilder = GraphqlExpressionBuilder<Map<String, dynamic>>();

final arg = {'name': 'test1', 'age': 99};

void main() {
  group('value expression tests', () {
    test('age equal 20', () {
      final func = listBuilder.anyBuild(age20ValEx);
      final result = func(arg);
      print(result);
      expect(result, equals(20));
    });
    test('age equal 40', () {
      final func = listBuilder.anyBuild(age40ValEx);
      final result = func(arg);
      print(result);
      expect(result, equals(40));
    });
    test('name equal ry', () {
      final func = listBuilder.anyBuild(nameRyEx);
      final result = func(arg);
      print(result);
      expect(result, equals('ry'));
    });
    test('name equal E', () {
      final func = listBuilder.anyBuild(nameEEx);
      final result = func(arg);
      print(result);
      expect(result, equals('E'));
    });
  });

  group('field expression tests', () {
    test('age field expression test', () {
      final func = listBuilder.anyBuild(fieldAgeEx);
      final result = func(arg);
      print(result);
      expect(result, equals(99));
    });
    test('name field expression test', () {
      final func = listBuilder.anyBuild(fieleNamedEx);
      final result = func(arg);
      print(result);
      expect(result, equals('test1'));
    });
  });

  group('list to operator expression test', () {
    test('equal test', () {
      final func1 = listBuilder.build(eqAge20Ex);
      final func2 = listBuilder.build(notEqAge20Ex);

      final result1 = func1(denny);
      final result2 = func2(epon);

      print('${eqAge20Ex.name}:$result1 ${notEqAge20Ex.name}:$result2');
      expect(result1 & result2, equals(true));
    });

    test('greater test', () {
      final func1 = listBuilder.build(gtAge20Ex);
      final func2 = listBuilder.build(geAge20Ex);

      final result1 = func1(chery);
      final result2 = func2(denny);
      print('${gtAge20Ex.name}:$result1 ${geAge20Ex.name}:$result2');
      expect(result1 & result2, equals(true));
    });

    test('startwith test', () {
      final startNameE = StartWithExpression(
        fieleNamedEx,
        nameEEx,
        name: 'startNameE',
      );
      final func = listBuilder.build(startNameE);
      final result = func(epon);
      print('${startNameE.name}:${result}');
      expect(result, equals(true));
    });

    test('endwith test', () {
      final endNameRy = EndWithExpression(
        fieleNamedEx,
        nameRyEx,
        name: 'endNameRy',
      );
      final func = listBuilder.build(endNameRy);
      final result = func(chery);
      print('${endNameRy.name}:${result}');
      expect(result, equals(true));
    });

    test('like test', () {
      final likeNameRy = LikeExpression(
        fieleNamedEx,
        nameoEx,
        name: 'likeNameRy',
      );
      final func = listBuilder.build(likeNameRy);
      final result = func(ansony);
      print('${likeNameRy.name}:${result}');
      expect(result, equals(true));
    });

    test('in tests', () {
      final inEx = InExpression(
        fieleNamedEx,
        ValueExpression(map.map((t) => t['name']).toList()),
        name: 'inEx',
      );
      final func = listBuilder.build(inEx);
      final result = func(fourmura);
      print('${inEx.name}:$result');
      expect(result, equals(false));
    });

    test('and tests', () {
      final endNameRy = EndWithExpression(
        fieleNamedEx,
        nameRyEx,
        name: 'endNameRy',
      );
      final andEx = AndExpression(gtAge20Ex, endNameRy, name: 'andEx');
      final func = listBuilder.build(andEx);
      final result = func(chery);
      print('${andEx.name}:$result');
      expect(result, equals(true));
    });

    test('or test', () {
      final startNameE = StartWithExpression(
        fieleNamedEx,
        nameEEx,
        name: 'startNameE',
      );
      final orEx = OrExpression(startNameE, gtAge20Ex, name: 'orEx');
      final func = listBuilder.build(orEx);
      final result = func(chery);
      print('${orEx.name}:$result');
      expect(result, equals(true));
    });
  });

  group('SQL to operator expression test', () {
    test('equal test', () {
      final func1 = sqlBuilder.build(eqNameAge20Ex);
      final func2 = sqlBuilder.build(notNameEqAge20Ex);

      final result1 = func1(denny);
      final result2 = func2(epon);

      final result = '$result1 $result2';

      print(result);
      expect(result, equals('age = 20 age <> 20'));
    });

    test('greater test', () {
      final func1 = sqlBuilder.build(gtNameAge20Ex);
      final func2 = sqlBuilder.build(geNameAge20Ex);

      final result1 = func1(chery);
      final result2 = func2(denny);

      final result = '$result1 $result2';

      print(result);
      expect(result, equals('age > 20 age >= 20'));
    });

    test('startwith test', () {
      final startNameE = StartWithExpression(
        nameFieleNamedEx,
        nameEEx,
        name: 'startNameE',
      );
      final func = sqlBuilder.build(startNameE);
      final result = func(epon);
      print(result);
      expect(result, equals("name LIKE 'E%'"));
    });

    test('endwith test', () {
      final endNameRy = EndWithExpression(
        nameFieleNamedEx,
        nameRyEx,
        name: 'endNameRy',
      );
      final func = sqlBuilder.build(endNameRy);
      final result = func(chery);
      print(result);
      expect(result, equals("name LIKE '%ry'"));
    });

    test('like test', () {
      final likeNameRy = LikeExpression(
        nameFieleNamedEx,
        nameoEx,
        name: 'likeNameRy',
      );
      final func = sqlBuilder.build(likeNameRy);
      final result = func(ansony);
      print(result);
      expect(result, equals("name LIKE '%o%'"));
    });

    test('in tests', () {
      final inEx = InExpression(
        nameFieleNamedEx,
        ValueExpression(map.map((t) => t['name']).toList()),
        name: 'inEx',
      );
      final func = sqlBuilder.build(inEx);
      final result = func(fourmura);
      print(result);
      expect(
        result,
        equals("name IN ('Ansony','Berry','Chery','Denny','Epon')"),
      );
    });

    test('and tests', () {
      final endNameRy = EndWithExpression(
        nameFieleNamedEx,
        nameRyEx,
        name: 'endNameRy',
      );
      final andEx = AndExpression(gtNameAge20Ex, endNameRy, name: 'andEx');
      final func = sqlBuilder.build(andEx);
      final result = func(chery);
      print(result);
      expect(result, equals("(age > 20 AND name LIKE '%ry')"));
    });

    test('or test', () {
      final startNameE = StartWithExpression(
        nameFieleNamedEx,
        nameEEx,
        name: 'startNameE',
      );
      final orEx = OrExpression(startNameE, gtNameAge20Ex, name: 'orEx');
      final func = sqlBuilder.build(orEx);
      final result = func(chery);
      print(result);
      expect(result, equals("(name LIKE 'E%' OR age > 20)"));
    });
  });

  group('GraphQL to operator expression test', () {
    test('equal test', () {
      final func1 = graphqlBuilder.build(eqNameAge20Ex);
      final func2 = graphqlBuilder.build(notNameEqAge20Ex);

      final result1 = func1(denny);
      final result2 = func2(epon);

      final result = '$result1 $result2';

      print(result);
      expect(result, equals('{age: {_eq: 20}} {age: {_neq: 20}}'));
    });

    test('greater test', () {
      final func1 = sqlBuilder.build(gtNameAge20Ex);
      final func2 = sqlBuilder.build(geNameAge20Ex);

      final result1 = func1(chery);
      final result2 = func2(denny);

      final result = '$result1 $result2';

      print(result);
      expect(result, equals('age > 20 age >= 20'));
    });

    test('startwith test', () {
      final startNameE = StartWithExpression(
        nameFieleNamedEx,
        nameEEx,
        name: 'startNameE',
      );
      final func = sqlBuilder.build(startNameE);
      final result = func(epon);
      print(result);
      expect(result, equals("name LIKE 'E%'"));
    });

    test('endwith test', () {
      final endNameRy = EndWithExpression(
        nameFieleNamedEx,
        nameRyEx,
        name: 'endNameRy',
      );
      final func = sqlBuilder.build(endNameRy);
      final result = func(chery);
      print(result);
      expect(result, equals("name LIKE '%ry'"));
    });

    test('like test', () {
      final likeNameRy = LikeExpression(
        nameFieleNamedEx,
        nameoEx,
        name: 'likeNameRy',
      );
      final func = sqlBuilder.build(likeNameRy);
      final result = func(ansony);
      print(result);
      expect(result, equals("name LIKE '%o%'"));
    });

    test('in tests', () {
      final inEx = InExpression(
        nameFieleNamedEx,
        ValueExpression(map.map((t) => t['name']).toList()),
        name: 'inEx',
      );
      final func = sqlBuilder.build(inEx);
      final result = func(fourmura);
      print(result);
      expect(
        result,
        equals("name IN ('Ansony','Berry','Chery','Denny','Epon')"),
      );
    });

    test('and tests', () {
      final endNameRy = EndWithExpression(
        nameFieleNamedEx,
        nameRyEx,
        name: 'endNameRy',
      );
      final andEx = AndExpression(gtNameAge20Ex, endNameRy, name: 'andEx');
      final func = sqlBuilder.build(andEx);
      final result = func(chery);
      print(result);
      expect(result, equals("(age > 20 AND name LIKE '%ry')"));
    });

    test('or test', () {
      final startNameE = StartWithExpression(
        nameFieleNamedEx,
        nameEEx,
        name: 'startNameE',
      );
      final orEx = OrExpression(startNameE, gtNameAge20Ex, name: 'orEx');
      final func = sqlBuilder.build(orEx);
      final result = func(chery);
      print(result);
      expect(result, equals("(name LIKE 'E%' OR age > 20)"));
    });
  });

  group('list sort expression  test', () {
    test('asc name', () {
      print(map.map((t) => t['name']).toList().join(','));
      final ascEx = SortFieldExpression<Map<String, dynamic>>(
        (t) => t['age'],
        name: 'ascEx',
      );
      final sortBuilder = SortListExpressionBuilder<Map<String, dynamic>>();
      final func = sortBuilder.build(ascEx);
      map.sort(func);
      print(map.map((t) => t['name']).toList().join(','));
      final result = map.first['name'];
      print('${ascEx.name} : $result');
      expect(result, equals('Epon'));
    });
    test('desc age', () {
      print(map.map((t) => t['name']).toList().join(','));
      final descEx = SortFieldExpression<Map<String, dynamic>>(
        (t) => t['name'],
        name: 'descEx',
        isDesc: true,
      );
      final sortBuilder = SortListExpressionBuilder<Map<String, dynamic>>();
      final func = sortBuilder.build(descEx);
      map.sort(func);
      print(map.map((t) => t['name']).toList().join(','));
      final result = map.first['name'];
      print('${descEx.name} : $result');
      expect(result, equals('Epon'));
    });
  });

  group('sort sql', () {
    test('asc age', () {
      final ascEx = SortNameFieldExpression('age', name: 'ascEx');
      final sortBuilder = SortSqlExpressionBuilder<Map<String, dynamic>>();
      final func = sortBuilder.build(ascEx);
      final result = func(fourmura);
      print(result);
      expect(result, equals('age ASC'));
    });
    test('desc name', () {
      final descEx = SortNameFieldExpression(
        'name',
        name: 'descEx',
        isDesc: true,
      );
      final sortBuilder = SortSqlExpressionBuilder<Map<String, dynamic>>();
      final func = sortBuilder.build(descEx);
      final result = func(fourmura);
      print(result);
      expect(result, equals('name DESC'));
    });
    test('sql list expression', () {
      final ascEx = SortNameFieldExpression('age', name: 'ascEx');
      final descEx = SortNameFieldExpression(
        'name',
        name: 'descEx',
        isDesc: true,
      );
      final list = SortListExpression(sortOrderList: [ascEx, descEx]);
      final sortBuilder = SortSqlExpressionBuilder<Map<String, dynamic>>();
      final func = sortBuilder.build(list);
      final result = func(fourmura);
      print(result);
      expect(result, equals('age ASC,name DESC'));
    });
  });
}
