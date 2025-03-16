// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponseFailureModel _$ApiResponseFailureModelFromJson(
    Map<String, dynamic> json) {
  return _ApiResponseFailureModel.fromJson(json);
}

/// @nodoc
mixin _$ApiResponseFailureModel {
  ApiFailureMessage? get message => throw _privateConstructorUsedError;

  /// Serializes this ApiResponseFailureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponseFailureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseFailureModelCopyWith<ApiResponseFailureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseFailureModelCopyWith<$Res> {
  factory $ApiResponseFailureModelCopyWith(ApiResponseFailureModel value,
          $Res Function(ApiResponseFailureModel) then) =
      _$ApiResponseFailureModelCopyWithImpl<$Res, ApiResponseFailureModel>;
  @useResult
  $Res call({ApiFailureMessage? message});

  $ApiFailureMessageCopyWith<$Res>? get message;
}

/// @nodoc
class _$ApiResponseFailureModelCopyWithImpl<$Res,
        $Val extends ApiResponseFailureModel>
    implements $ApiResponseFailureModelCopyWith<$Res> {
  _$ApiResponseFailureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponseFailureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ApiFailureMessage?,
    ) as $Val);
  }

  /// Create a copy of ApiResponseFailureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiFailureMessageCopyWith<$Res>? get message {
    if (_value.message == null) {
      return null;
    }

    return $ApiFailureMessageCopyWith<$Res>(_value.message!, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseFailureModelImplCopyWith<$Res>
    implements $ApiResponseFailureModelCopyWith<$Res> {
  factory _$$ApiResponseFailureModelImplCopyWith(
          _$ApiResponseFailureModelImpl value,
          $Res Function(_$ApiResponseFailureModelImpl) then) =
      __$$ApiResponseFailureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiFailureMessage? message});

  @override
  $ApiFailureMessageCopyWith<$Res>? get message;
}

/// @nodoc
class __$$ApiResponseFailureModelImplCopyWithImpl<$Res>
    extends _$ApiResponseFailureModelCopyWithImpl<$Res,
        _$ApiResponseFailureModelImpl>
    implements _$$ApiResponseFailureModelImplCopyWith<$Res> {
  __$$ApiResponseFailureModelImplCopyWithImpl(
      _$ApiResponseFailureModelImpl _value,
      $Res Function(_$ApiResponseFailureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponseFailureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ApiResponseFailureModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ApiFailureMessage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseFailureModelImpl implements _ApiResponseFailureModel {
  _$ApiResponseFailureModelImpl({this.message});

  factory _$ApiResponseFailureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseFailureModelImplFromJson(json);

  @override
  final ApiFailureMessage? message;

  @override
  String toString() {
    return 'ApiResponseFailureModel(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseFailureModelImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiResponseFailureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseFailureModelImplCopyWith<_$ApiResponseFailureModelImpl>
      get copyWith => __$$ApiResponseFailureModelImplCopyWithImpl<
          _$ApiResponseFailureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseFailureModelImplToJson(
      this,
    );
  }
}

abstract class _ApiResponseFailureModel implements ApiResponseFailureModel {
  factory _ApiResponseFailureModel({final ApiFailureMessage? message}) =
      _$ApiResponseFailureModelImpl;

  factory _ApiResponseFailureModel.fromJson(Map<String, dynamic> json) =
      _$ApiResponseFailureModelImpl.fromJson;

  @override
  ApiFailureMessage? get message;

  /// Create a copy of ApiResponseFailureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseFailureModelImplCopyWith<_$ApiResponseFailureModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
