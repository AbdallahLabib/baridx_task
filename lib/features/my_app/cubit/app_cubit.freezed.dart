// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  ThemeMode get themeData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({ThemeMode themeData, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      themeData: null == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentAppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$CurrentAppStateImplCopyWith(_$CurrentAppStateImpl value,
          $Res Function(_$CurrentAppStateImpl) then) =
      __$$CurrentAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeData, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$CurrentAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$CurrentAppStateImpl>
    implements _$$CurrentAppStateImplCopyWith<$Res> {
  __$$CurrentAppStateImplCopyWithImpl(
      _$CurrentAppStateImpl _value, $Res Function(_$CurrentAppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CurrentAppStateImpl(
      themeData: null == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CurrentAppStateImpl implements _CurrentAppState {
  _$CurrentAppStateImpl(
      {this.themeData = ThemeMode.light,
      this.isLoading = false,
      this.errorMessage});

  @override
  @JsonKey()
  final ThemeMode themeData;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AppState(themeData: $themeData, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentAppStateImpl &&
            (identical(other.themeData, themeData) ||
                other.themeData == themeData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, themeData, isLoading, errorMessage);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentAppStateImplCopyWith<_$CurrentAppStateImpl> get copyWith =>
      __$$CurrentAppStateImplCopyWithImpl<_$CurrentAppStateImpl>(
          this, _$identity);
}

abstract class _CurrentAppState implements AppState {
  factory _CurrentAppState(
      {final ThemeMode themeData,
      final bool isLoading,
      final String? errorMessage}) = _$CurrentAppStateImpl;

  @override
  ThemeMode get themeData;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentAppStateImplCopyWith<_$CurrentAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
