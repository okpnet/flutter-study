import 'package:expression_test/expression_test.dart';
import 'package:test/test.dart';

final map = <Map<String, dynamic>>[
  {'name': 'Ansony', 'age': 50},
  {'name': 'Berry', 'age': 40},
  {'name': 'Chery', 'age': 30},
  {'name': 'Denny', 'age': 20},
  {'name': 'Epon', 'age': 10},
];

final age20ValEx = ValueExpression(20, name: 'age20ValEx');
final age40ValEx = ValueExpression(40, name: 'age40ValEx');
final nameRyEx = ValueExpression('ry', name: 'nameRyEx');
final nameEEx = ValueExpression('E', name: 'nameEEx');

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

final listBuilder = ListExpressionBuilder<Map<String, dynamic>>();
final sqlBuilder = SqlExpressionBuilder<Map<String, dynamic>>();

final arg = {'name': '', 'age': 0};

void main() {
  group('expression tests', () {
    test('age equal 20', () {
      final func = listBuilder.build(age20ValEx);
      final result = func(arg);
      print(result);
      expect(result, equals('Denny'));
    });
  });
  group('list debug group of tests', () {
    test('age equal 20', () {});
  });
}
