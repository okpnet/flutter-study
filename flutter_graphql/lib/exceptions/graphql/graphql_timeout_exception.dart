part of 'graphql_exception.dart';

final class GraphqlTimeoutException implements Exception {
  final String? message;

  GraphqlTimeoutException._({this.message});

  factory GraphqlTimeoutException({String? message}) {
    return GraphqlTimeoutException._(message: message);
  }

  @override
  String toString() => 'GraphqlTimeoutException: $message';
}
