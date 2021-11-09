import 'package:meta/meta.dart';
import 'package:omar_alshyokh_test/state_management/category_actions.dart';
import 'package:omar_alshyokh_test/state_management/category_reducer.dart';
import 'package:omar_alshyokh_test/state_management/category_state.dart';
import 'package:redux/redux.dart';

import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetCategoryStateAction) {
    final nextPostsState = categoryReducer(state.categoryState, action);

    return state.copyWith(categoryState: nextPostsState);
  }

  return state;
}

@immutable
class AppState {
  final CategoryState categoryState;

  AppState({
    required this.categoryState,
  });

  AppState copyWith({
    CategoryState? categoryState,
  }) {
    return AppState(
      categoryState: categoryState ?? this.categoryState,
    );
  }
}

class Redux {
  static Store<AppState>? _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store!;
    }
  }

  static Future<void> init() async {
    final  categoriesStateInitial = CategoryState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(categoryState: categoriesStateInitial),
    );
  }
}