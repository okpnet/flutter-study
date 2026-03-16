part of 'graphql_exception.dart';

final class GraphqlEditModelException implements Exception {
  final String? message;

  GraphqlEditModelException._({this.message});

  factory GraphqlEditModelException({String? message}) {
    return GraphqlEditModelException._(message: message);
  }

  @override
  String toString() => 'GraphqlEditModelException: $message';
}
