import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/repository/categories_repository.dart';
import 'bloc.dart';

class CategoriesBloc extends Bloc<CategoryEvent, CategoriesState> {
  final CategoriesRepository categoriesRepository;

  CategoriesBloc({required this.categoriesRepository})
      : super(CategoriesLoading());

  @override
  Stream<CategoriesState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoriesLoad) {
      yield CategoriesLoading();
      try {
        final categoriesList = await categoriesRepository.getCategories();
        yield CategoriesLoadSuccess(categoriesList);
      } catch (_) {
        yield CategoriesOperationError();
      }
    } else if (event is CategoryCreate) {
      try {
        yield CategoriesLoading();
        await categoriesRepository.createCategory(event.category);
        final categoriesList = await categoriesRepository.getCategories();
        yield CategoriesLoadSuccess(categoriesList);
      } catch (_) {
        yield CategoriesOperationError();
      }
    } else if (event is CategoryUpdate) {
      try {
        yield CategoriesLoading();
        await categoriesRepository.updateCategory(event.category);
        final categoriesList = await categoriesRepository.getCategories();

        yield CategoriesLoadSuccess(categoriesList);
      } catch (_) {
        yield CategoriesOperationError();
      }
    }

    if (event is CategoryDelete) {
      try {
        yield CategoriesLoading();
        await categoriesRepository.deleteCategory(event.category.id!);
        final categoriesList = await categoriesRepository.getCategories();
        yield CategoriesLoadSuccess(categoriesList);
      } catch (_) {
        yield CategoriesOperationError();
      }
    }
  }
}
