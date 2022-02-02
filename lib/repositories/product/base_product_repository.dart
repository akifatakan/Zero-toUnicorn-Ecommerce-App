import 'package:zero_to_unicorn/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}