import 'package:meta/meta.dart';
import 'package:omar_alshyokh_test/models/category/category_item_model.dart';
import 'package:omar_alshyokh_test/models/category/category_list_response_model.dart';


@immutable
class CategoryState {
  final bool? isError;
  final bool? isLoading;
  final  List<CategoryItemModel>? categories;

  CategoryState({
    this.isError,
    this.isLoading,
    this.categories,
  });

  factory CategoryState.initial() => CategoryState(
    isLoading: false,
    isError: false,
    categories: const [],
  );

  CategoryState copyWith({
     bool? isError,
     bool? isLoading,
     List<CategoryItemModel>? categories,
  }) {
    return CategoryState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}