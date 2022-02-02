import 'package:zero_to_unicorn/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();

}