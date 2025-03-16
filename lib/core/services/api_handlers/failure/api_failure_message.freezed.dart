// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failure_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiFailureMessage _$ApiFailureMessageFromJson(Map<String, dynamic> json) {
  return _ApiFailureMessage.fromJson(json);
}

/// @nodoc
mixin _$ApiFailureMessage {
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this ApiFailureMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiFailureMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiFailureMessageCopyWith<ApiFailureMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureMessageCopyWith<$Res> {
  factory $ApiFailureMessageCopyWith(
          ApiFailureMessage value, $Res Function(ApiFailureMessage) then) =
      _$ApiFailureMessageCopyWithImpl<$Res, ApiFailureMessage>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$ApiFailureMessageCopyWithImpl<$Res, $Val extends ApiFailureMessage>
    implements $ApiFailureMessageCopyWith<$Res> {
  _$ApiFailureMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiFailureMessage
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
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiFailureMessageImplCopyWith<$Res>
    implements $ApiFailureMessageCopyWith<$Res> {
  factory _$$ApiFailureMessageImplCopyWith(_$ApiFailureMessageImpl value,
          $Res Function(_$ApiFailureMessageImpl) then) =
      __$$ApiFailureMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ApiFailureMessageImplCopyWithImpl<$Res>
    extends _$ApiFailureMessageCopyWithImpl<$Res, _$ApiFailureMessageImpl>
    implements _$$ApiFailureMessageImplCopyWith<$Res> {
  __$$ApiFailureMessageImplCopyWithImpl(_$ApiFailureMessageImpl _value,
      $Res Function(_$ApiFailureMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiFailureMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ApiFailureMessageImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiFailureMessageImpl implements _ApiFailureMessage {
  _$ApiFailureMessageImpl({this.message});

  factory _$ApiFailureMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiFailureMessageImplFromJson(json);

  @override
  final String? message;

  @override
  String toString() {
    return 'ApiFailureMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailureMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ApiFailureMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiFailureMessageImplCopyWith<_$ApiFailureMessageImpl> get copyWith =>
      __$$ApiFailureMessageImplCopyWithImpl<_$ApiFailureMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiFailureMessageImplToJson(
      this,
    );
  }
}

abstract class _ApiFailureMessage implements ApiFailureMessage {
  factory _ApiFailureMessage({final String? message}) = _$ApiFailureMessageImpl;

  factory _ApiFailureMessage.fromJson(Map<String, dynamic> json) =
      _$ApiFailureMessageImpl.fromJson;

  @override
  String? get message;

  /// Create a copy of ApiFailureMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiFailureMessageImplCopyWith<_$ApiFailureMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
