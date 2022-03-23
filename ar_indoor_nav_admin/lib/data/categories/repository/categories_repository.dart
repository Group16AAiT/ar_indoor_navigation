import 'package:ar_indoor_nav_admin/data/categories/data_provider/category_data.dart';
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';

class CategoriesRepository {
  final CategoriesDataProvider dataProvider;

  CategoriesRepository({required this.dataProvider});

  Future<Category> createCategory(Category category) async {
    return await dataProvider.createCategory(category);
  }

  Future<List<Category>> getCategories() async {
    return await dataProvider.getCategories();
  }

  Future<void> updateCategory(Category category) async {
    await dataProvider.updateCategory(category);
  }

  Future<void> deleteCategory(String id) async {
    await dataProvider.deleteCategory(id);
  }
}
