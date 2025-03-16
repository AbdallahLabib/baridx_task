// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'no_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoResponse _$NoResponseFromJson(Map<String, dynamic> json) {
  return _NoResponse.fromJson(json);
}

/// @nodoc
mixin _$NoResponse {
  /// Serializes this NoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoResponseCopyWith<$Res> {
  factory $NoResponseCopyWith(
          NoResponse value, $Res Function(NoResponse) then) =
      _$NoResponseCopyWithImpl<$Res, NoResponse>;
}

/// @nodoc
class _$NoResponseCopyWithImpl<$Res, $Val extends NoResponse>
    implements $NoResponseCopyWith<$Res> {
  _$NoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NoResponseImplCopyWith<$Res> {
  factory _$$NoResponseImplCopyWith(
          _$NoResponseImpl value, $Res Function(_$NoResponseImpl) then) =
      __$$NoResponseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoResponseImplCopyWithImpl<$Res>
    extends _$NoResponseCopyWithImpl<$Res, _$NoResponseImpl>
    implements _$$NoResponseImplCopyWith<$Res> {
  __$$NoResponseImplCopyWithImpl(
      _$NoResponseImpl _value, $Res Function(_$NoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NoResponseImpl implements _NoResponse {
  _$NoResponseImpl();

  factory _$NoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoResponseImplFromJson(json);

  @override
  String toString() {
    return 'NoResponse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoResponseImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$NoResponseImplToJson(
      this,
    );
  }
}

abstract class _NoResponse implements NoResponse {
  factory _NoResponse() = _$NoResponseImpl;

  factory _NoResponse.fromJson(Map<String, dynamic> json) =
      _$NoResponseImpl.fromJson;
}
