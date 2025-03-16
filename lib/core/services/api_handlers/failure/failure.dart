import 'package:json_annotation/json_annotation.dart';

part 'failure.g.dart';

@JsonSerializable()
class ApiResponseFailureModel {
  String? message;

  ApiResponseFailureModel({
    this.message,
  });

  factory ApiResponseFailureModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFailureModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseFailureModelToJson(this);
}
