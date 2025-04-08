import 'payment_method.dart';

class OrderCreationModel {
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? packageType;
  final double? weight;
  final String? deliveryNotes;
  final PaymentMethod? paymentMethod;
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;
  final String? cvvCode;
  final String? payLaterPhoneNumber;

  OrderCreationModel({
    this.name,
    this.phoneNumber,
    this.address,
    this.packageType,
    this.weight,
    this.deliveryNotes,
    this.paymentMethod,
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
    this.cvvCode,
    this.payLaterPhoneNumber,
  });

  OrderCreationModel copyWith({
    String? name,
    String? phoneNumber,
    String? address,
    String? packageType,
    double? weight,
    String? deliveryNotes,
    PaymentMethod? paymentMethod,
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
    String? cvvCode,
    String? payLaterPhoneNumber,
  }) {
    return OrderCreationModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      packageType: packageType ?? this.packageType,
      weight: weight ?? this.weight,
      deliveryNotes: deliveryNotes ?? this.deliveryNotes,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      cvvCode: cvvCode ?? this.cvvCode,
      payLaterPhoneNumber: payLaterPhoneNumber ?? this.payLaterPhoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'packageType': packageType,
      'weight': weight,
      'deliveryNotes': deliveryNotes,
      'paymentMethod': paymentMethod?.toJson(),
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cvvCode': cvvCode,
      'payLaterPhoneNumber': payLaterPhoneNumber,
    };
  }

  factory OrderCreationModel.fromJson(Map<String, dynamic> json) {
    return OrderCreationModel(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      packageType: json['packageType'] as String?,
      weight: json['weight'] as double?,
      deliveryNotes: json['deliveryNotes'] as String?,
      paymentMethod: PaymentMethod.fromJson(json['paymentMethod'] as String?),
      cardNumber: json['cardNumber'] as String?,
      cardHolderName: json['cardHolderName'] as String?,
      expiryDate: json['expiryDate'] as String?,
      cvvCode: json['cvvCode'] as String?,
      payLaterPhoneNumber: json['payLaterPhoneNumber'] as String?,
    );
  }
}
