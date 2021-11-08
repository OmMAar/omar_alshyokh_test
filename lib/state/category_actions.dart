import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:omar_alshyokh_test/data/repo/repository.dart';
import 'package:omar_alshyokh_test/di/components/service_locator.dart';
import 'package:omar_alshyokh_test/state/category_state.dart';
import 'package:omar_alshyokh_test/state/category_store.dart';
import 'package:redux/redux.dart';

@immutable
class SetCategoryStateAction {
  final CategoryState categoryState;

  SetCategoryStateAction(this.categoryState);
}

Future<void> fetchCategoriesAction(
    Store<AppState> store, CancelToken cancelToken) async {
  store.dispatch(SetCategoryStateAction(CategoryState(isLoading: true)));

  Repository _repository = getIt<Repository>();
  try {
    final response = await _repository.getCategories(cancelToken: cancelToken);
    if (response.data != null && response.data!.data != null)
      store.dispatch(
        SetCategoryStateAction(
          CategoryState(
            isLoading: false,
            categories: response.data!.data,
          ),
        ),
      );
  } catch (error) {
    store.dispatch(SetCategoryStateAction(CategoryState(isLoading: false)));
  }
}
