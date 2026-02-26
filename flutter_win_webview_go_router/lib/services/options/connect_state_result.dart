sealed class ConnectStateResult<T> {
  final int statusCode;
  const ConnectStateResult({this.statusCode = 0});
  factory ConnectStateResult.success(T value, {int statusCode = 200}) =>
      SuccessState<T>(value, statusCode: statusCode);
  factory ConnectStateResult.failure(Exception error, {int statusCode = 500}) =>
      FailureState<T>(error, statusCode: statusCode);
}

final class SuccessState<T> extends ConnectStateResult<T> {
  final T value;
  const SuccessState(this.value, {super.statusCode = 200});
}

final class FailureState<T> extends ConnectStateResult<T> {
  final Exception error;
  const FailureState(this.error, {super.statusCode = 500});
}
