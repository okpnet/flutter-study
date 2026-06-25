import '../condisiton/expressions/expressions.dart';
import '../sort/sort_extpressions/sort_expressions.dart';

class ExpressionError extends Error {
  final Expression errorExpression;
  final String message;
  final Error innerError;

  ExpressionError(this.errorExpression, this.innerError, [String? addMessage])
    : message =
          'There is propblem that ${errorExpression.name ?? errorExpression.toString()}.\r$addMessage\r${innerError.toString()}';
}

class SortExpressionError extends Error {
  final SortExpression errorExpression;
  final String message;
  final Error innerError;

  SortExpressionError(
    this.errorExpression,
    this.innerError, [
    String? addMessage,
  ]) : message =
           'There is propblem that ${errorExpression.name ?? errorExpression.toString()}.\r$addMessage\r${innerError.toString()}';
}
