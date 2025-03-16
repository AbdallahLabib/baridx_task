import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure_message.freezed.dart';
part 'api_failure_message.g.dart';

@freezed
class ApiFailureMessage with _$ApiFailureMessage {
  factory ApiFailureMessage({
    String? message,
  }) = _ApiFailureMessage;

  factory ApiFailureMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiFailureMessageFromJson(json);
}
