part of '../error.dart';

class NetworkTimeoutException extends TimeoutException {
  NetworkTimeoutException() : super(NetworkError.timeout);
}
