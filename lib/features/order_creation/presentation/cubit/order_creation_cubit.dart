import 'package:baridx_task/features/order_creation/data/models/order_creation_model.dart';
import 'package:baridx_task/features/order_creation/data/models/payment_method.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/order_creation_repository.dart';

part 'order_creation_cubit.freezed.dart';

// State class for managing order creation process
// Handles the multi-step form data and validation states
@freezed
class OrderCreationState with _$OrderCreationState {
  factory OrderCreationState({
    @Default(0) int currentStep, // Current active step in the order creation process
    OrderCreationModel? orderData, // Contains all the order details
    @Default(false) bool isLoading, // Loading state for async operations
    @Default(false) bool isOrderCreated, // Indicates if order was successfully created
    @Default(4) int totalSteps, // Total number of steps in the order process
    @Default({}) Map<int, bool> completedSteps, // Tracks which steps are completed
    @Default('') String errorMessage, // Stores error messages if any
  }) = _OrderCreationState;
}

// Manages the business logic for the order creation process
// Handles form validation, step navigation, and order submission
@injectable
class OrderCreationCubit extends Cubit<OrderCreationState> {
  final OrderCreationRepository _orderCreationRepository;

  OrderCreationCubit(
    this._orderCreationRepository,
  ) : super(OrderCreationState(orderData: OrderCreationModel()));

  // Resets the order creation process to initial state
  void reset() {
    emit(OrderCreationState(orderData: OrderCreationModel(), currentStep: 0, completedSteps: {}));
  }

  // Updates customer information and validates the input
  // Handles name, phone number, and address validation
  void updateCustomerInfo({
    String? name,
    String? phoneNumber,
    String? address,
  }) {
    if (state.orderData == null) return;

    final updatedOrder = state.orderData!.copyWith(
      name: name,
      phoneNumber: phoneNumber,
      address: address,
    );

    // First emit the updated order
    emit(state.copyWith(orderData: updatedOrder));

    // Then validate with the new state and update completion status
    final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
    newCompletedSteps[0] = validateCustomerInfo();

    emit(state.copyWith(completedSteps: newCompletedSteps));
  }

  // Updates package details and validates the input
  // Handles package type, weight, and delivery notes
  void updatePackageDetails({
    String? packageType,
    double? weight,
    String? deliveryNotes,
  }) {
    if (state.orderData == null) return;

    final updatedOrder = state.orderData!.copyWith(
      packageType: packageType,
      weight: weight,
      deliveryNotes: deliveryNotes,
    );

    // First emit the updated order
    emit(state.copyWith(orderData: updatedOrder));

    // Then validate with the new state and update completion status
    final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
    newCompletedSteps[1] = validatePackageDetails();

    emit(state.copyWith(completedSteps: newCompletedSteps));
  }

  // Updates payment details and validates the input based on payment method
  // Handles both credit card and pay later payment methods
  void updatePaymentDetails({
    PaymentMethod? paymentMethod,
    String? cardNumber,
    String? payLaterPhoneNumber,
    String? expiryDate,
    String? cardHolderName,
    String? cvvCode,
  }) {
    if (state.orderData == null) return;

    final updatedOrder = state.orderData!.copyWith(
      paymentMethod: paymentMethod,
      cardNumber: paymentMethod == PaymentMethod.creditCard ? cardNumber : null,
      cardHolderName: paymentMethod == PaymentMethod.creditCard ? cardHolderName : null,
      expiryDate: paymentMethod == PaymentMethod.creditCard ? expiryDate : null,
      cvvCode: paymentMethod == PaymentMethod.creditCard ? cvvCode : null,
      payLaterPhoneNumber: paymentMethod == PaymentMethod.payLater ? payLaterPhoneNumber : null,
    );

    // First emit the updated order
    emit(state.copyWith(orderData: updatedOrder));

    // Then validate with the new state and update completion status
    final newCompletedSteps = Map<int, bool>.from(state.completedSteps);
    newCompletedSteps[2] = validatePaymentDetails();

    emit(state.copyWith(completedSteps: newCompletedSteps));
  }

  // Navigates to the previous step in the order creation process
  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  // Validates customer information (Step 1)
  // Checks if name, phone number, and address are properly filled
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

  // Validates package details (Step 2)
  // Ensures package type is selected and weight is valid
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

  // Validates payment details (Step 3)
  // Validates based on selected payment method (credit card or pay later)
  bool validatePaymentDetails() {
    final orderData = state.orderData;
    if (orderData == null) return false;

    final paymentMethod = orderData.paymentMethod;
    if (paymentMethod == null) {
      return false;
    }

    if (paymentMethod == PaymentMethod.payLater) {
      final payLaterPhone = orderData.payLaterPhoneNumber;
      if (payLaterPhone == null || payLaterPhone.trim().length < 11) {
        return false;
      }
    }

    if (paymentMethod == PaymentMethod.creditCard) {
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

    if (paymentMethod == PaymentMethod.payLater) {
      final payLaterPhone = orderData.payLaterPhoneNumber;
      if (payLaterPhone == null || payLaterPhone.trim().isEmpty) {
        return false;
      }
    }

    return true;
  }

  // Checks if current step is the review step
  bool get isReviewStep => state.currentStep >= state.totalSteps;

  // Validates the current step based on step index
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

  // Returns list of completed steps
  // Used to show step completion status in UI
  List<bool> get completedSteps {
    final steps = List.generate(state.totalSteps, (index) => state.completedSteps[index] ?? false);
    if (state.currentStep < state.totalSteps && isCurrentStepValid()) {
      steps[state.currentStep] = true;
    }
    return steps;
  }

  // Handles navigation to next step and validates current step
  // Also handles the final review step
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
      emit(state.copyWith(isLoading: false, errorMessage: 'Invalid order data'));
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      final result = await _orderCreationRepository.createOrder(state.orderData!);
      if (result) {
        emit(state.copyWith(isOrderCreated: true, isLoading: false));
      }
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }

  // Checks if order can be submitted
  // Validates all steps are completed
  bool get canSubmitOrder {
    return state.currentStep == state.totalSteps - 1 &&
        validateCustomerInfo() &&
        validatePackageDetails() &&
        validatePaymentDetails();
  }
}
