import 'package:hive/hive.dart';
import 'package:snag_application_1/models/category.dart';
import 'package:snag_application_1/repositories/category/category_repository.dart';

class LocalCategoryRepository implements CategoryRepository{
  final Box<Category> _categoryBox = Hive.box<Category>('categories');

  @override
  Future<void> addCategory(Category category) async {
    await _categoryBox.add(category);
  }

  @override
  List<Category> getCategories() {
    return _categoryBox.values.toList();
  }

  @override
  Future<void> updateCategory(Category category) async {
    await _categoryBox.putAt(_categoryBox.keyAt(category.key!), category);
  }

  @override
  Future<void> deleteCategory(Category category) async {
    await _categoryBox.deleteAt(_categoryBox.keyAt(category.key!));
  }

  @override
  Future<void> deleteAllCategories() async {
    await _categoryBox.clear();
  }

  Future<void> closeBox() async {
    await _categoryBox.close();
  }

  @override
  Category? getCategoryById(String uuid) {
    try {
      return _categoryBox.values.firstWhere((element) => element.id == uuid);
    } catch (e) {
      return null as Category?;
    }
  }

  @override
  List<Category?> getCategoryByName(String name) {
    return _categoryBox.values.where((element) => element.name == name).toList();
  }
}