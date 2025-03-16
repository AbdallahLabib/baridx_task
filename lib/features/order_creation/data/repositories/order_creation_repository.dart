import 'package:injectable/injectable.dart';
import '../models/order_creation_model.dart';

abstract class OrderCreationRepository {
  Future<bool> createOrder(OrderCreationModel order);
}

@Injectable(as: OrderCreationRepository)
class OrderCreationRepositoryImpl implements OrderCreationRepository {
  @override
  Future<bool> createOrder(OrderCreationModel order) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}