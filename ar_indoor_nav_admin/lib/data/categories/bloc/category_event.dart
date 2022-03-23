import 'package:equatable/equatable.dart';
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoriesLoad extends CategoryEvent {
  const CategoriesLoad();

  @override
  List<Object> get props => [];
}

class CategoryCreate extends CategoryEvent {
  final Category category;

  const CategoryCreate(this.category);

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'Category Created {category: $category}';
}

class CategoryUpdate extends CategoryEvent {
  final Category category;

  const CategoryUpdate(this.category);

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'Category Updated {category: $category}';
}

class CategoryDelete extends CategoryEvent {
  final Category category;

  const CategoryDelete(this.category);

  @override
  List<Object> get props => [category];

  @override
  toString() => 'Category Deleted {category: $category}';
}
