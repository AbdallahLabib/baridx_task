// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_creation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderCreationState {
  int get currentStep => throw _privateConstructorUsedError;
  OrderCreationModel? get orderData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isOrderCreated => throw _privateConstructorUsedError;
  int get totalSteps => throw _privateConstructorUsedError;
  Map<int, bool> get completedSteps => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreationStateCopyWith<OrderCreationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreationStateCopyWith<$Res> {
  factory $OrderCreationStateCopyWith(
          OrderCreationState value, $Res Function(OrderCreationState) then) =
      _$OrderCreationStateCopyWithImpl<$Res, OrderCreationState>;
  @useResult
  $Res call(
      {int currentStep,
      OrderCreationModel? orderData,
      bool isLoading,
      bool isOrderCreated,
      int totalSteps,
      Map<int, bool> completedSteps,
      String errorMessage});
}

/// @nodoc
class _$OrderCreationStateCopyWithImpl<$Res, $Val extends OrderCreationState>
    implements $OrderCreationStateCopyWith<$Res> {
  _$OrderCreationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? orderData = freezed,
    Object? isLoading = null,
    Object? isOrderCreated = null,
    Object? totalSteps = null,
    Object? completedSteps = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      orderData: freezed == orderData
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderCreationModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrderCreated: null == isOrderCreated
          ? _value.isOrderCreated
          : isOrderCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      totalSteps: null == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      completedSteps: null == completedSteps
          ? _value.completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCreationStateImplCopyWith<$Res>
    implements $OrderCreationStateCopyWith<$Res> {
  factory _$$OrderCreationStateImplCopyWith(_$OrderCreationStateImpl value,
          $Res Function(_$OrderCreationStateImpl) then) =
      __$$OrderCreationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStep,
      OrderCreationModel? orderData,
      bool isLoading,
      bool isOrderCreated,
      int totalSteps,
      Map<int, bool> completedSteps,
      String errorMessage});
}

/// @nodoc
class __$$OrderCreationStateImplCopyWithImpl<$Res>
    extends _$OrderCreationStateCopyWithImpl<$Res, _$OrderCreationStateImpl>
    implements _$$OrderCreationStateImplCopyWith<$Res> {
  __$$OrderCreationStateImplCopyWithImpl(_$OrderCreationStateImpl _value,
      $Res Function(_$OrderCreationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? orderData = freezed,
    Object? isLoading = null,
    Object? isOrderCreated = null,
    Object? totalSteps = null,
    Object? completedSteps = null,
    Object? errorMessage = null,
  }) {
    return _then(_$OrderCreationStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      orderData: freezed == orderData
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderCreationModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrderCreated: null == isOrderCreated
          ? _value.isOrderCreated
          : isOrderCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      totalSteps: null == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      completedSteps: null == completedSteps
          ? _value._completedSteps
          : completedSteps // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderCreationStateImpl implements _OrderCreationState {
  _$OrderCreationStateImpl(
      {this.currentStep = 0,
      this.orderData,
      this.isLoading = false,
      this.isOrderCreated = false,
      this.totalSteps = 4,
      final Map<int, bool> completedSteps = const {},
      this.errorMessage = ''})
      : _completedSteps = completedSteps;

  @override
  @JsonKey()
  final int currentStep;
  @override
  final OrderCreationModel? orderData;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isOrderCreated;
  @override
  @JsonKey()
  final int totalSteps;
  final Map<int, bool> _completedSteps;
  @override
  @JsonKey()
  Map<int, bool> get completedSteps {
    if (_completedSteps is EqualUnmodifiableMapView) return _completedSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_completedSteps);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'OrderCreationState(currentStep: $currentStep, orderData: $orderData, isLoading: $isLoading, isOrderCreated: $isOrderCreated, totalSteps: $totalSteps, completedSteps: $completedSteps, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreationStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.orderData, orderData) ||
                other.orderData == orderData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOrderCreated, isOrderCreated) ||
                other.isOrderCreated == isOrderCreated) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            const DeepCollectionEquality()
                .equals(other._completedSteps, _completedSteps) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentStep,
      orderData,
      isLoading,
      isOrderCreated,
      totalSteps,
      const DeepCollectionEquality().hash(_completedSteps),
      errorMessage);

  /// Create a copy of OrderCreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreationStateImplCopyWith<_$OrderCreationStateImpl> get copyWith =>
      __$$OrderCreationStateImplCopyWithImpl<_$OrderCreationStateImpl>(
          this, _$identity);
}

abstract class _OrderCreationState implements OrderCreationState {
  factory _OrderCreationState(
      {final int currentStep,
      final OrderCreationModel? orderData,
      final bool isLoading,
      final bool isOrderCreated,
      final int totalSteps,
      final Map<int, bool> completedSteps,
      final String errorMessage}) = _$OrderCreationStateImpl;

  @override
  int get currentStep;
  @override
  OrderCreationModel? get orderData;
  @override
  bool get isLoading;
  @override
  bool get isOrderCreated;
  @override
  int get totalSteps;
  @override
  Map<int, bool> get completedSteps;
  @override
  String get errorMessage;

  /// Create a copy of OrderCreationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreationStateImplCopyWith<_$OrderCreationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
