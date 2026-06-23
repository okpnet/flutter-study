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
    test('age equal 20', () {
      final age20Ex = EquqleExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f1'),
        ValueExpression(20, name: 'v1'),
        isNot: true,
        name: 'eq1',
      );
      print(ExpressionBuilder.buildDebug(age20Ex));
      final whereFuction = ExpressionBuilder.build<Map<String, dynamic>, bool>(
        age20Ex,
        ListVisitor(),
      );
      final result = map
          .where(whereFuction)
          .toList()
          .map((t) => t['name'])
          .join(',');
      print(result);
      expect(result, equals('Denny'));
    });
    test('age le 40', () {
      final age40Ex = GreaterExpression(
        ValueExpression(40, name: 'v2'),
        FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f2'),
        isEqulity: true,
        name: 'g1',
      );
      print(ExpressionBuilder.buildDebug(age40Ex));
      final whereFuction = ExpressionBuilder.build<Map<String, dynamic>, bool>(
        age40Ex,
        ListVisitor(),
      );
      final result = map
          .where(whereFuction)
          .toList()
          .map((t) => t['name'])
          .join(',');
      print(result);
      expect(result, equals('Berry,Chery,Denny,Epon'));
    });
    test('and age eq 20 and le 40', () {
      final age20Ex = EquqleExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f1'),
        ValueExpression(20, name: 'v1'),
        isNot: true,
        name: 'eq1',
      );
      final age40Ex = GreaterExpression(
        ValueExpression(40, name: 'v2'),
        FieldExpression<Map<String, dynamic>>((t) => t['age'], name: 'f2'),
        isEqulity: true,
        name: 'g1',
      );
      final and = AndExpression(age20Ex, age40Ex, name: 'and1');
      print(ExpressionBuilder.buildDebug(and));
      final whereFuction = ExpressionBuilder.build<Map<String, dynamic>, bool>(
        and,
        ListVisitor(),
      );
      final result = map
          .where(whereFuction)
          .toList()
          .map((t) => t['name'])
          .join(',');
      print(result);
      expect(result, equals('Denny'));
    });
    test('and name contain start and end with ', () {
      final likeEx = LikeExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f1'),
        ValueExpression('e', name: 'v1'),
        // isNot: true,
        name: 'like1',
      );
      final startEx = StartWithExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f2'),
        ValueExpression('D', name: 'v2'),
        name: 'st1',
      );
      final endEx = EndWithExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f2'),
        ValueExpression('y', name: 'v2'),
        name: 'en1',
      );
      final and = AndExpression(
        likeEx,
        AndExpression(startEx, endEx, name: 'and2'),
        name: 'and1',
      );
      print(ExpressionBuilder.buildDebug(and));
      final whereFuction = ExpressionBuilder.build<Map<String, dynamic>, bool>(
        and,
        ListVisitor(),
      );
      final result = map
          .where(whereFuction)
          .toList()
          .map((t) => t['name'])
          .join(',');
      print(result);
      expect(result, equals('Denny'));
    });
    test('or name contain start and end with ', () {
      final likeEx = LikeExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f1'),
        ValueExpression('r', name: 'v1'),
        // isNot: true,
        name: 'like1',
      );
      final startEx = StartWithExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f2'),
        ValueExpression('C', name: 'v2'),
        name: 'st1',
      );
      final endEx = EndWithExpression(
        FieldExpression<Map<String, dynamic>>((t) => t['name'], name: 'f2'),
        ValueExpression('y', name: 'v2'),
        name: 'en1',
      );
      final and = AndExpression(
        likeEx,
        OrExpression(startEx, endEx, name: 'or1'),
        name: 'and1',
      );
      print(ExpressionBuilder.buildDebug(and));
      final whereFuction = ExpressionBuilder.build<Map<String, dynamic>, bool>(
        and,
        ListVisitor(),
      );
      final result = map
          .where(whereFuction)
          .toList()
          .map((t) => t['name'])
          .join(',');
      print(result);
      expect(result, equals('Berry,Chery'));
    });
    test('First Test', () {
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
      print(ExpressionBuilder.buildDebug(expression));
      final whereFuction = ExpressionBuilder.build<Map<String, dynamic>, bool>(
        expression,
        ListVisitor(),
      );
      final result = map
          .where(whereFuction)
          .toList()
          .map((t) => t['name'])
          .join(',');
      print(result);
      expect(result, equals('Denny'));
    });
  });
}
