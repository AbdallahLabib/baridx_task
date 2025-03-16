// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseFailureModelImpl _$$ApiResponseFailureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiResponseFailureModelImpl(
      message: json['message'] == null
          ? null
          : ApiFailureMessage.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseFailureModelImplToJson(
        _$ApiResponseFailureModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
