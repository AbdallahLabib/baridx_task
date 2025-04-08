import 'package:baridx_task/features/order_creation/data/models/payment_method.dart';
import 'package:baridx_task/features/order_creation/data/repositories/order_creation_repository.dart';
import 'package:baridx_task/features/order_creation/presentation/cubit/order_creation_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([OrderCreationRepository])
import 'order_creation_cubit_test.mocks.dart';

void main() {
  late OrderCreationCubit cubit;
  late MockOrderCreationRepository mockRepository;

  setUp(() {
    mockRepository = MockOrderCreationRepository();
    cubit = OrderCreationCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('Initial State', () {
    test('should have correct initial values', () {
      expect(cubit.state.currentStep, equals(0));
      expect(cubit.state.orderData, isNotNull);
      expect(cubit.state.isLoading, isFalse);
      expect(cubit.state.completedSteps, isEmpty);
      expect(cubit.state.errorMessage, isEmpty);
      expect(cubit.state.isOrderCreated, isFalse);
    });
  });

  group('Step Navigation', () {
    test('should increment step when moving forward', () async {
      // Fill in customer info to make the step valid
      cubit.updateCustomerInfo(
        name: 'John Doe',
        phoneNumber: '+12345678901',
        address: '123 Main St',
      );

      await cubit.nextStep();
      expect(cubit.state.currentStep, equals(1));

      // Fill in package details to make the step valid
      cubit.updatePackageDetails(
        packageType: 'Standard',
        weight: 5.0,
        deliveryNotes: 'Handle with care',
      );

      await cubit.nextStep();
      expect(cubit.state.currentStep, equals(2));
    });

    test('should not increment step when current step is invalid', () async {
      // Don't fill in any data, making the step invalid
      await cubit.nextStep();
      expect(cubit.state.currentStep, equals(0));
    });

    test('should decrement step when moving backward', () async {
      // Fill in required data and move forward
      cubit.updateCustomerInfo(
        name: 'John Doe',
        phoneNumber: '+12345678901',
        address: '123 Main St',
      );
      await cubit.nextStep();

      cubit.updatePackageDetails(
        packageType: 'Standard',
        weight: 5.0,
        deliveryNotes: 'Handle with care',
      );
      await cubit.nextStep();

      expect(cubit.state.currentStep, equals(2));

      cubit.previousStep();
      expect(cubit.state.currentStep, equals(1));
    });
  });

  group('Customer Information Step', () {
    test('should update customer information in state', () {
      const name = 'John Doe';
      const phone = '+1234567890';
      const address = '123 Main St';

      cubit.updateCustomerInfo(
        name: name,
        phoneNumber: phone,
        address: address,
      );

      expect(cubit.state.orderData?.name, equals(name));
      expect(cubit.state.orderData?.phoneNumber, equals(phone));
      expect(cubit.state.orderData?.address, equals(address));
    });

    test('should validate customer information correctly', () {
      // Invalid data
      cubit.updateCustomerInfo(name: '', phoneNumber: '', address: '');
      expect(cubit.validateCustomerInfo(), isFalse);
      expect(cubit.state.completedSteps[0], isFalse);

      // Valid data
      cubit.updateCustomerInfo(
        name: 'John Doe',
        phoneNumber: '+1234567890',
        address: '123 Main St',
      );
      expect(cubit.validateCustomerInfo(), isTrue);
      expect(cubit.state.completedSteps[0], isTrue);
    });
  });

  group('Package Details Step', () {
    test('should update package details in state', () {
      const type = 'Express';
      const weight = 2.5;
      const notes = 'Fragile';

      cubit.updatePackageDetails(
        packageType: type,
        weight: weight,
        deliveryNotes: notes,
      );

      expect(cubit.state.orderData?.packageType, equals(type));
      expect(cubit.state.orderData?.weight, equals(weight));
      expect(cubit.state.orderData?.deliveryNotes, equals(notes));
    });

    test('should validate package details correctly', () {
      // Invalid data
      cubit.updatePackageDetails(packageType: '', weight: -1, deliveryNotes: '');
      expect(cubit.validatePackageDetails(), isFalse);
      expect(cubit.state.completedSteps[1], isFalse);

      // Valid data
      cubit.updatePackageDetails(
        packageType: 'Standard',
        weight: 5.0,
        deliveryNotes: 'Handle with care',
      );
      expect(cubit.validatePackageDetails(), isTrue);
      expect(cubit.state.completedSteps[1], isTrue);
    });
  });

  group('Payment Step', () {
    test('should update credit card payment details in state', () {
      const cardNumber = '4111111111111111';
      const cardHolder = 'John Doe';
      const expiryDate = '12/25';
      const cvvCode = '123';

      cubit.updatePaymentDetails(
        paymentMethod: PaymentMethod.creditCard,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cvvCode: cvvCode,
        cardHolderName: cardHolder,
      );

      expect(cubit.state.orderData?.paymentMethod, equals(PaymentMethod.creditCard));
      expect(cubit.state.orderData?.cardNumber, equals(cardNumber));
      expect(cubit.state.orderData?.cardHolderName, equals(cardHolder));
      expect(cubit.state.orderData?.expiryDate, equals(expiryDate));
      expect(cubit.state.orderData?.cvvCode, equals(cvvCode));
    });

    test('should update pay later details in state', () {
      const payLaterPhone = '+1234567890';

      cubit.updatePaymentDetails(
        paymentMethod: PaymentMethod.payLater,
        payLaterPhoneNumber: payLaterPhone,
      );

      expect(cubit.state.orderData?.paymentMethod, equals(PaymentMethod.payLater));
      expect(cubit.state.orderData?.payLaterPhoneNumber, equals(payLaterPhone));
    });

    test('should validate credit card payment details correctly', () {
      // Invalid data
      cubit.updatePaymentDetails(
        paymentMethod: PaymentMethod.creditCard,
        cardNumber: '1234',
        expiryDate: '12/20',
        cvvCode: '12',
        cardHolderName: '',
      );
      expect(cubit.validatePaymentDetails(), isFalse);
      expect(cubit.state.completedSteps[2], isFalse);

      // Valid data
      cubit.updatePaymentDetails(
        paymentMethod: PaymentMethod.creditCard,
        cardNumber: '4111111111111111',
        expiryDate: '12/25',
        cvvCode: '123',
        cardHolderName: 'John Doe',
      );
      expect(cubit.validatePaymentDetails(), isTrue);
      expect(cubit.state.completedSteps[2], isTrue);
    });

    test('should validate pay later details correctly', () {
      // Invalid data
      cubit.updatePaymentDetails(
        paymentMethod: PaymentMethod.payLater,
        payLaterPhoneNumber: '',
      );
      expect(cubit.validatePaymentDetails(), isFalse);
      expect(cubit.state.completedSteps[2], isFalse);

      // Valid data
      cubit.updatePaymentDetails(
        paymentMethod: PaymentMethod.payLater,
        payLaterPhoneNumber: '+1234567890',
      );
      expect(cubit.validatePaymentDetails(), isTrue);
      expect(cubit.state.completedSteps[2], isTrue);
    });
  });

  group('Order Submission', () {
    setUp(() {
      // Setup complete valid order data
      cubit.updateCustomerInfo(
        name: 'John Doe',
        phoneNumber: '+1234567890',
        address: '123 Main St',
      );
      cubit.updatePackageDetails(
        packageType: 'Standard',
        weight: 5.0,
        deliveryNotes: 'Handle with care',
      );
      cubit.updatePaymentDetails(
        paymentMethod: PaymentMethod.creditCard,
        cardNumber: '4111111111111111',
        expiryDate: '12/25',
        cvvCode: '123',
        cardHolderName: 'John Doe',
      );
    });

    test('should handle successful order submission', () async {
      when(mockRepository.createOrder(any)).thenAnswer((_) async => true);

      await cubit.submitOrder();

      verify(mockRepository.createOrder(any)).called(1);
      expect(cubit.state.isLoading, isFalse);
      expect(cubit.state.isOrderCreated, isTrue);
      expect(cubit.state.errorMessage, isEmpty);
    });

    test('should handle failed order submission', () async {
      when(mockRepository.createOrder(any)).thenThrow(Exception('Network error'));

      await cubit.submitOrder();

      verify(mockRepository.createOrder(any)).called(1);
      expect(cubit.state.isLoading, isFalse);
      expect(cubit.state.isOrderCreated, isFalse);
      expect(cubit.state.errorMessage, isNotEmpty);
    });
  });

  group('Reset Functionality', () {
    test('should clear all state data', () {
      // Setup some data
      cubit.updateCustomerInfo(
        name: 'John Doe',
        phoneNumber: '+1234567890',
        address: '123 Main St',
      );
      cubit.updatePackageDetails(
        packageType: 'Standard',
        weight: 5.0,
        deliveryNotes: 'Handle with care',
      );

      // Reset the state
      cubit.reset();

      // Verify state is cleared
      expect(cubit.state.currentStep, equals(0));
      expect(cubit.state.orderData, isNotNull);
      expect(cubit.state.orderData?.name, isNull);
      expect(cubit.state.orderData?.phoneNumber, isNull);
      expect(cubit.state.orderData?.address, isNull);
      expect(cubit.state.orderData?.packageType, isNull);
      expect(cubit.state.orderData?.weight, isNull);
      expect(cubit.state.orderData?.deliveryNotes, isNull);
      expect(cubit.state.completedSteps, isEmpty);
      expect(cubit.state.errorMessage, isEmpty);
      expect(cubit.state.isOrderCreated, isFalse);
    });
  });
}
