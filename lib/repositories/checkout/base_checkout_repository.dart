import 'package:zero_to_unicorn/models/models.dart';

abstract class BaseCheckoutRepository {
  Future <void> addCheckout (Checkout checkout);
}