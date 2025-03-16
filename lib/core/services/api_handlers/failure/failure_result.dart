import 'api_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'failure_result.freezed.dart';

@freezed
class FailureResult with _$FailureResult {
  const factory FailureResult({
    required FailureReasons reason,
    required String debugMessage,
    ApiResponseFailureModel? model,
  }) = _FailureResult;
}

enum FailureReasons {
  noInternetConnection,
  timeout,
  tokenExpired,
  unknown,
  storage,
  unauthorized,
  redirection,
  forbidden,
}
