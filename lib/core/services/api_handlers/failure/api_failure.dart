import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_failure_message.dart';

part 'api_failure.freezed.dart';
part 'api_failure.g.dart';

@freezed
class ApiResponseFailureModel with _$ApiResponseFailureModel {
  factory ApiResponseFailureModel({
    ApiFailureMessage? message,
  }) = _ApiResponseFailureModel;

  factory ApiResponseFailureModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFailureModelFromJson(json);
}
