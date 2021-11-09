import 'package:omar_alshyokh_test/state_management/category_actions.dart';
import 'package:omar_alshyokh_test/state_management/category_state.dart';

categoryReducer(CategoryState prevState, SetCategoryStateAction action) {
  final payload = action.categoryState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    categories: payload.categories,
  );
}