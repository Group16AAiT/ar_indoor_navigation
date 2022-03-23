import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';

class CategoriesDataProvider {
  final _baseUrl = 'http://192.168.1.72:8080';
  final http.Client httpClient;

  CategoriesDataProvider({required this.httpClient});

  Future<Category> createCategory(Category category) async {
    final response = await httpClient.post(
      Uri.parse('$_baseUrl/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': category.name,
      }),
    );

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw Exception('Failed to create category.');
    }
  }

  Future<List<Category>> getCategories() async {
    final response = await httpClient.get(Uri.parse('$_baseUrl/categories'));

    if (response.statusCode == 200) {
      final categoriesList = jsonDecode(response.body) as List;
      return categoriesList
          .map((currCategory) => Category.fromJson(currCategory))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> deleteCategory(String id) async {
    final http.Response response = await httpClient.delete(
      Uri.parse('$_baseUrl/categories/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete category.');
    }
  }

  Future<void> updateCategory(Category category) async {
    final http.Response response = await httpClient.put(
      Uri.parse('$_baseUrl/categories/${category.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': category.id,
        'name': category.name,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update category.');
    }
  }
}
