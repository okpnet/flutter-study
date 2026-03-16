part of 'graphql_exception.dart';

final class GraphqlInsertException implements Exception {
  final String? message;

  GraphqlInsertException._({this.message});

  factory GraphqlInsertException({String? message}) {
    return GraphqlInsertException._(message: message);
  }

  @override
  String toString() => 'GraphqlInsertException: $message';
}
