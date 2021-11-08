import 'package:bubble_lens/bubble_lens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:omar_alshyokh_test/common/users/user_grid_view_with_filter_pagination.dart';
import 'package:omar_alshyokh_test/common/widgets/base_body.dart';
import 'package:omar_alshyokh_test/common/widgets/vertical_padding.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/models/category/category_interest_item_model.dart';
import 'package:omar_alshyokh_test/models/category/category_item_model.dart';
import 'package:omar_alshyokh_test/state/category_actions.dart';
import 'package:omar_alshyokh_test/state/category_store.dart';
import 'package:omar_alshyokh_test/ui/user_management/widgets/button_user_management_widget.dart';
import 'package:omar_alshyokh_test/utils/device/app_uitls.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // //stores:---------------------------------------------------------------------

  var _cancelToken = CancelToken();

  void _getCategories() {
    Redux.store.dispatch(fetchCategoriesAction(Redux.store, _cancelToken));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _getCategories();
  }

  //
  // @override
  // Widget build(BuildContext context) {
  //   super.build(context);
  //   AppBar appBar = AppBar(
  //     title: Text("Home"),
  //     backgroundColor: AppColors.appBarBGColor,
  //     brightness: Brightness.light,
  //     elevation: 0,
  //   );
  //
  //   double widthC = DeviceUtils.getScaledWidth(context, 1);
  //   double heightC = DeviceUtils.getScaledHeight(context, 1) -
  //       appBar.preferredSize.height -
  //       MediaQuery.of(context).viewPadding.top;
  //
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Center(
  //         child: Container(
  //           color: Colors.black,
  //           child: BubbleLens(
  //               width: MediaQuery.of(context).size.width,
  //               height: MediaQuery.of(context).size.height,
  //               widgets: [
  //                 for (var i = 0; i < 100; i++)
  //                   Container(
  //                     width: 100,
  //                     height: 100,
  //                     color: [Colors.red, Colors.green, Colors.blue][i % 3],
  //                   )
  //               ]
  //           ),
  //         )
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.categoryState.isLoading ?? false,
            builder: (context, isLoading) {
              if (isLoading) {
                return CircularProgressIndicator();
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.categoryState.isError ?? false,
            builder: (context, isError) {
              if (isError) {
                return Text("Failed to get posts");
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Expanded(
            child: StoreConnector<AppState, List<CategoryItemModel>>(
              distinct: true,
              converter: (store) => store.state.categoryState.categories ?? [],
              builder: (context, categories) {
                return _buildPosts(categories);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPosts(List<CategoryItemModel> categories) {
    print(categories.length);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height ,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [

                AppColors.mainStartBG,
                AppColors.mainEndBG,

              ],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd),
        ),
        child: Column(
          children: [
            VerticalPadding(percentage: 0.1,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.space20),
              child: Row(
                children: [
                  Icon(Icons.arrow_back,color: AppColors.white,),
                  Flexible(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                          categories[2].name?.toUpperCase()??"",
                        style: appTextStyle.smallTSBasic.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Text("")

                ],
              ),
            ),
            VerticalPadding(percentage: 0.1,),
            Container(
              child: Text(
                "What are you into?",
                style: appTextStyle.bigTSBasic.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            Expanded(
              child: BubbleLens(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height ,
                  highRatio: .9,
                  lowRatio: 0.3,
                  widgets: categories[2].interests!
                      .map(
                        (category) => Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  AppColors.firstBac,
                                  AppColors.firstBac,
                                  AppColors.midBac,
                                  AppColors.secondBac
                                ],
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter),
                          ),
                          child: Stack(
                            children: [
                              CachedNetworkImage(imageUrl: AppUtils.notNullOrEmpty(category.image)?"https://api.zipconnect.app/img/interests/${category.image}":""),
                              Center(
                                child: Text(
                                  category.name ?? "",
                                  style: appTextStyle.smallTSBasic
                                      .copyWith(color: AppColors.darkGreen),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList()),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
              alignment: AlignmentDirectional.center,
              child: ButtonUserManagementWidget(
                width: MediaQuery.of(context).size.width*.8,
                height: 45,
                backgroundColor: AppColors.white,
                gradient: LinearGradient(
                    colors: [
                      AppColors.firstBac,
                      AppColors.firstBac,
                      AppColors.midBac,
                      AppColors.secondBac
                    ],
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd),
                borderRadius: 10,
                borderColor: AppColors.transparent,
                onPressed: () {  },
                child: Center(
                  child: Text(
                    "Continue".toUpperCase(),
                    style: appTextStyle.smallTSBasic.copyWith(
                      color: AppColors.white
                    ),
                  ),
                ),
              )
            ),
          ],
        ));
  }

  Widget _buildBody({required double width, required double height}) {
    return BaseBody(
      portraitWidget: _portraitWidget(
        height: height,
        width: width,
      ),
      landscapeWidget: _landscapeWidget(
        height: height,
        width: width,
      ),
      isSafeAreaTop: false,
    );
  }

  // portrait view:--------------------------------------------------------------
  Widget _portraitWidget({
    required double width,
    required double height,
  }) {
    return Container(
      height: height,
      width: width,
      child: UserGridViewWithFilterPaginationWidget(
        cancelToken: _cancelToken,
        width: width,
      ),
    );
  }

  // landscape view:--------------------------------------------------------------
  Widget _landscapeWidget({
    required double width,
    required double height,
  }) {
    return Container(
      height: height,
      width: width,
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimens.horizontal_padding),
      child: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                VerticalPadding(
                  percentage: 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cancelToken.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
