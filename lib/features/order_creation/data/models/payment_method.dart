enum PaymentMethod {
  creditCard(0, 'Credit Card'),
  payLater(1, 'Pay Later'),
  cash(2, 'Cash');

  final int type;
  final String name;
  const PaymentMethod(this.type, this.name);

  String toJson() => name;

  static PaymentMethod? fromJson(String? json) {
    if (json == null) return null;
    return PaymentMethod.values.firstWhere(
      (e) => e.name == json,
      orElse: () => throw ArgumentError('Invalid PaymentMethod: $json'),
    );
  }
}
