part of 'graphql_exception.dart';

final class GraphqlUpdateException implements Exception {
  final String? message;

  GraphqlUpdateException._({this.message});

  factory GraphqlUpdateException({String? message}) {
    return GraphqlUpdateException._(message: message);
  }

  @override
  String toString() => 'GraphqlUpdateException: $message';
}
