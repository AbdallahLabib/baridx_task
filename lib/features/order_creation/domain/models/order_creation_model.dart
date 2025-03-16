class CustomerInfo {
  final String name;
  final String phoneNumber;
  final String address;

  CustomerInfo({
    required this.name,
    required this.phoneNumber,
    required this.address,
  });
}

class PackageDetails {
  final String packageType;
  final double weight;
  final String? deliveryNotes;

  PackageDetails({
    required this.packageType,
    required this.weight,
    this.deliveryNotes,
  });
}

enum PaymentMethod { creditCard, cashOnDelivery, payLater }

class PaymentDetails {
  final PaymentMethod method;
  final String? cardNumber;
  final String? payLaterPhone;

  PaymentDetails({
    required this.method,
    this.cardNumber,
    this.payLaterPhone,
  });
}

class OrderCreationModel {
  final CustomerInfo? customerInfo;
  final PackageDetails? packageDetails;
  final PaymentDetails? paymentDetails;

  OrderCreationModel({
    this.customerInfo,
    this.packageDetails,
    this.paymentDetails,
  });

  OrderCreationModel copyWith({
    CustomerInfo? customerInfo,
    PackageDetails? packageDetails,
    PaymentDetails? paymentDetails,
  }) {
    return OrderCreationModel(
      customerInfo: customerInfo ?? this.customerInfo,
      packageDetails: packageDetails ?? this.packageDetails,
      paymentDetails: paymentDetails ?? this.paymentDetails,
    );
  }
}