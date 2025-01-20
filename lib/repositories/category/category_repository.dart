import 'package:snag_application_1/models/category.dart';

abstract class CategoryRepository {
  Future<void> addCategory(Category category);
  List<Category> getCategories();
  Future<void> updateCategory(Category category);
  Future<void> deleteCategory(Category category);
  Future<void> deleteAllCategories();
  Category? getCategoryById(String uuid);
  List<Category?> getCategoryByName(String name);
}