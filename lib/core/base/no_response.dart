import 'package:freezed_annotation/freezed_annotation.dart';

part 'no_response.freezed.dart';
part 'no_response.g.dart';

@freezed
class NoResponse with _$NoResponse {
  factory NoResponse() = _NoResponse;

  factory NoResponse.fromJson(Map<String, dynamic> json) => _$NoResponseFromJson(json);
}
