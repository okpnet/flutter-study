sealed class Result<T> {
  const Result();
  factory Result.success(T value) => Success<T>(value);
  factory Result.warning(Error error) => Warning<T>(error);
  factory Result.failure(Exception error) => Failure<T>(error);
}

final class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

final class Warning<T> extends Result<T> {
  final Error error;
  const Warning(this.error);
}

final class Failure<T> extends Result<T> {
  final Exception error;
  const Failure(this.error);
}
