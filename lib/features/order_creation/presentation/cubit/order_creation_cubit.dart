import 'package:baridx_task/core/services/dialog_service/dialogs/dialog_model.dart';
import 'package:baridx_task/features/order_creation/data/models/order_creation_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/dialog_service/dialog_service.dart';
import '../../../../core/services/navigation_service/navigation_service.dart';
import '../../data/repositories/order_creation_repository.dart';

part 'order_creation_cubit.freezed.dart';

@freezed
class OrderCreationState with _$OrderCreationState {
  factory OrderCreationState({
    @Default(0) int currentStep,
    OrderCreationModel? orderData,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isOrderCreated,
    @Default(4) int totalSteps,
    @Default({}) Map<int, bool> completedSteps,
  }) = _OrderCreationState;
}

@injectable
class OrderCreationCubit extends Cubit<OrderCreationState> {
  final DialogService _dialogService;
  final OrderCreationRepository _orderCreationRepository;
  final NavigationService _navigationService;

  OrderCreationCubit(
    this._dialogService,
    this._orderCreationRepository,
    this._navigationService,
  ) : super(OrderCreationState(orderData: OrderCreationModel()));

  void updateCustomerInfo({
    String? name,
    String? phoneNumber,
    String? address,
  }) {
    if (state.orderData == null) return;

    final updatedOrder = OrderCreationModel(
      name: name ?? state.orderData?.name,
      phoneNumber: phoneNumber ?? state.orderData?.phoneNumber,
      address: address ?? state.orderData?.address,
      packageType: state.orderData?.packageType,
      weight: state.orderData?.weight,
      deliveryNotes: state.orderData?.deliveryNotes,
      paymentMethod: state.orderData?.paymentMethod,
      cardNumber: state.orderData?.cardNumber,
      payLaterPhoneNumber: state.orderData?.payLaterPhoneNumber,
    );

    // First emit the updated order
    emit(state.copyWith(orderData: updatedOrder));

    // Then validate with the new state and update completion status
    final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
    newCompletedSteps[0] = validateCustomerInfo();

    emit(state.copyWith(completedSteps: newCompletedSteps));
  }

  void updatePackageDetails({
    String? packageType,
    double? weight,
    String? deliveryNotes,
  }) {
    if (state.orderData == null) return;

    final updatedOrder = OrderCreationModel(
      name: state.orderData?.name,
      phoneNumber: state.orderData?.phoneNumber,
      address: state.orderData?.address,
      packageType: packageType ?? state.orderData?.packageType,
      weight: weight ?? state.orderData?.weight,
      deliveryNotes: deliveryNotes ?? state.orderData?.deliveryNotes,
      paymentMethod: state.orderData?.paymentMethod,
      cardNumber: state.orderData?.cardNumber,
      payLaterPhoneNumber: state.orderData?.payLaterPhoneNumber,
    );

    // First emit the updated order
    emit(state.copyWith(orderData: updatedOrder));

    // Then validate with the new state and update completion status
    final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
    newCompletedSteps[1] = validatePackageDetails();

    emit(state.copyWith(completedSteps: newCompletedSteps));
  }

  void updatePaymentDetails({
    String? paymentMethod,
    String? cardNumber,
    String? payLaterPhoneNumber,
    String? expiryDate,
    String? cardHolderName,
    String? cvvCode,
  }) {
    if (state.orderData == null) return;

    final updatedOrder = OrderCreationModel(
      name: state.orderData?.name,
      phoneNumber: state.orderData?.phoneNumber,
      address: state.orderData?.address,
      packageType: state.orderData?.packageType,
      weight: state.orderData?.weight,
      deliveryNotes: state.orderData?.deliveryNotes,
      paymentMethod: paymentMethod,
      cardNumber: paymentMethod == 'Credit Card' ? cardNumber : null,
      cardHolderName: paymentMethod == 'Credit Card' ? cardHolderName : null,
      expiryDate: paymentMethod == 'Credit Card' ? expiryDate : null,
      cvvCode: paymentMethod == 'Credit Card' ? cvvCode : null,
      payLaterPhoneNumber: paymentMethod == 'Pay Later' ? payLaterPhoneNumber : null,
    );

    // First emit the updated order
    emit(state.copyWith(orderData: updatedOrder));

    // Then validate with the new state and update completion status
    final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
    newCompletedSteps[2] = validatePaymentDetails();

    emit(state.copyWith(completedSteps: newCompletedSteps));
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  bool validateCustomerInfo() {
    final orderData = state.orderData;
    if (orderData == null) return false;

    final name = orderData.name;
    final phone = orderData.phoneNumber;
    final address = orderData.address;

    if (name == null ||
        name.trim().isEmpty ||
        phone == null ||
        phone.trim().length < 11 || // Updated validation
        address == null ||
        address.trim().isEmpty) {
      return false;
    }
    return true;
  }

  bool validatePackageDetails() {
    final orderData = state.orderData;
    if (orderData == null) return false;

    final packageType = orderData.packageType;
    final weight = orderData.weight;

    if (packageType == null || packageType.trim().isEmpty || weight == null || weight <= 0) {
      return false;
    }
    return true;
  }

  bool validatePaymentDetails() {
    final orderData = state.orderData;
    if (orderData == null) return false;

    final paymentMethod = orderData.paymentMethod;
    if (paymentMethod == null || paymentMethod.trim().isEmpty) {
      return false;
    }

    if (paymentMethod == 'Pay Later') {
      final payLaterPhone = orderData.payLaterPhoneNumber;
      if (payLaterPhone == null || payLaterPhone.trim().length < 11) {
        return false;
      }
    }

    if (paymentMethod == 'Credit Card') {
      if (orderData.cardNumber == null ||
          orderData.cardNumber!.trim().isEmpty ||
          orderData.cardHolderName == null ||
          orderData.cardHolderName!.trim().isEmpty ||
          orderData.expiryDate == null ||
          orderData.expiryDate!.trim().isEmpty ||
          orderData.cvvCode == null ||
          orderData.cvvCode!.trim().isEmpty) {
        return false;
      }
    }

    if (paymentMethod == 'Pay Later') {
      final payLaterPhone = orderData.payLaterPhoneNumber;
      if (payLaterPhone == null || payLaterPhone.trim().isEmpty) {
        return false;
      }
    }

    return true;
  }

  bool get isReviewStep => state.currentStep >= state.totalSteps;

  bool isCurrentStepValid() {
    switch (state.currentStep) {
      case 0:
        return validateCustomerInfo();
      case 1:
        return validatePackageDetails();
      case 2:
        return validatePaymentDetails();
      case 3:
        return true;
      default:
        return false;
    }
  }

  List<bool> get completedSteps {
    final steps = List.generate(state.totalSteps, (index) => state.completedSteps[index] ?? false);
    if (state.currentStep < state.totalSteps && isCurrentStepValid()) {
      steps[state.currentStep] = true;
    }
    return steps;
  }

  void nextStep() async {
    if (!isCurrentStepValid()) return;

    emit(state.copyWith(isLoading: true));

    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 800));

    if (state.currentStep == state.totalSteps - 1) {
      final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
      for (int i = 0; i <= state.currentStep; i++) {
        switch (i) {
          case 0:
            newCompletedSteps[i] = validateCustomerInfo();
            break;
          case 1:
            newCompletedSteps[i] = validatePackageDetails();
            break;
          case 2:
            newCompletedSteps[i] = validatePaymentDetails();
            break;
        }
      }
      emit(state.copyWith(
        completedSteps: newCompletedSteps,
        currentStep: state.totalSteps,
        isLoading: false,
      ));
      return;
    }

    if (state.currentStep < state.totalSteps - 1) {
      final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
      for (int i = 0; i <= state.currentStep; i++) {
        switch (i) {
          case 0:
            newCompletedSteps[i] = validateCustomerInfo();
            break;
          case 1:
            newCompletedSteps[i] = validatePackageDetails();
            break;
          case 2:
            newCompletedSteps[i] = validatePaymentDetails();
            break;
        }
      }
      emit(state.copyWith(
        currentStep: state.currentStep + 1,
        completedSteps: newCompletedSteps,
        isLoading: false,
      ));
    }
  }

  Future<void> submitOrder() async {
    if (state.orderData == null) {
      _dialogService.showErrorMessage(errorMessage: 'Invalid order data');
      return;
    }

    emit(state.copyWith(isLoading: true));
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      final result = await _orderCreationRepository.createOrder(state.orderData!);
      if (result) {
        emit(state.copyWith(isOrderCreated: true, isLoading: false));
        _dialogService.showAppDialog(DialogModel.confirm(primaryText: 'Order created successfully!'));
        _navigationService.pop();
      }
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
      _dialogService.showErrorMessage(errorMessage: error.toString());
    }
  }

  bool get canSubmitOrder {
    return state.currentStep == state.totalSteps - 1 &&
        validateCustomerInfo() &&
        validatePackageDetails() &&
        validatePaymentDetails();
  }
}
