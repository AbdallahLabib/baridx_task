import '../services/api_handlers/failure/failure_result.dart';

abstract class AppUseCase<T, Params> {
  T execute(Params params);

  FailureResult handleError(dynamic error) {
    if (error is FailureResult) return error;
    return FailureResult(
      reason: FailureReasons.unknown,
      debugMessage: error.toString(),
    );
  }
}

abstract class AppAsyncUseCase<T, Params> extends AppUseCase<Future<T>, Params> {
  @override
  Future<T> execute(Params params);
}

class NoParams {
  const NoParams();
}
