import 'package:expression_test/expression_test.dart';
import 'package:test/test.dart';

final map = <Map<String, dynamic>>[
  {'name': 'Ansony', 'age': 50},
  {'name': 'Berry', 'age': 40},
  {'name': 'Chery', 'age': 30},
  {'name': 'Denny', 'age': 20},
  {'name': 'Epon', 'age': 10},
];
void main() {
  group('debug group of tests', () {
    test('debug str', () {
      final expresison = AndExpression(
        AndExpression(
          EquqleExpression(
            FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f1'),
            ValueExpression(20, name: 'v1'),
            isNot: true,
            name: 'eq1',
          ),
          GreaterExpression(
            ValueExpression(40, name: 'v2'),
            FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f2'),
            isEqulity: true,
            name: 'g1',
          ),
          name: 'and2',
        ),
        EquqleExpression(
          FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f3'),
          ValueExpression('Denny', name: 'v3'),
          name: 'eq1',
        ),
        name: 'top',
      );

      final builder = ExpressionBuilder().buildDebug<Map<String, dynamic>>(
        expresison,
      );
      print(builder);
      expect(builder.length, greaterThan(0));
    });

    test('First Test', () {
      final age20Ex = EquqleExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f1'),
        ValueExpression(20, name: 'v1'),
        isNot: true,
        name: 'eq1',
      );
      final expression = AndExpression(
        AndExpression(
          EquqleExpression(
            FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f1'),
            ValueExpression(20, name: 'v1'),
            isNot: true,
            name: 'eq1',
          ),
          GreaterExpression(
            ValueExpression(40, name: 'v2'),
            FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f2'),
            isEqulity: true,
            name: 'g1',
          ),
          name: 'and2',
        ),
        EquqleExpression(
          FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f3'),
          ValueExpression('Denny', name: 'v3'),
          name: 'eq1',
        ),
        name: 'top',
      );

      final builder = ExpressionBuilder().buildDebug<Map<String, dynamic>>(
        expression,
      );
      print(builder);
      final fuction = ExpressionBuilder().build<Map<String, dynamic>, bool>(
        age20Ex,
        ListVisitor(),
      );
      print(fuction);
      final result = map.where(fuction).toList();
      print(result);
    });
  });
}
