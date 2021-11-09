import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:omar_alshyokh_test/common/users/user_grid_view_with_filter_pagination.dart';
import 'package:omar_alshyokh_test/common/widgets/vertical_padding.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/models/category/category_interest_item_model.dart';
import 'package:omar_alshyokh_test/models/category/category_item_model.dart';
import 'package:omar_alshyokh_test/state_management/category_actions.dart';
import 'package:omar_alshyokh_test/state_management/category_store.dart';
import 'package:omar_alshyokh_test/ui/home/widgets/items_slider_widget.dart';
import 'package:omar_alshyokh_test/ui/home/widgets/media_user_indicator_widget.dart';
import 'package:omar_alshyokh_test/ui/user_management/widgets/button_user_management_widget.dart';
import 'package:omar_alshyokh_test/utils/device/app_uitls.dart';
import 'package:omar_alshyokh_test/utils/device/device_utils.dart';
import 'package:omar_alshyokh_test/utils/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // //stores:---------------------------------------------------------------------

  var _cancelToken = CancelToken();

  void _getCategories() {
    Redux.store.dispatch(fetchCategoriesAction(Redux.store, _cancelToken));
  }

  PageController controller =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  int categoryIndex = 0;

  Set<CategoryInterestItemModel> selectedInterests = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      body: Container(
        width: widthC,
        height: heightC,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, bool>(
              distinct: true,
              converter: (store) =>
                  store.state.categoryState.isLoading ?? false,
              builder: (context, isLoading) {
                if (isLoading) {
                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
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
            StoreConnector<AppState, List<CategoryItemModel>>(
              distinct: true,
              converter: (store) => store.state.categoryState.categories ?? [],
              builder: (context, categories) {
                if (categories.isNotEmpty) {
                  return _buildPosts(categories, heightC, widthC);
                  //return Center(child: CircularProgressIndicator());

                } else {
                  return SizedBox.shrink();
                }
                // return _buildPosts(categories,heightC,widthC);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosts(
      List<CategoryItemModel> categories, double height, double width) {
    print(categories.length);
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColors.mainStartBG,
                AppColors.mainEndBG,
              ],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalPadding(
                  percentage: 0.1,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      categories[categoryIndex].name?.toUpperCase() ?? "",
                      style: appTextStyle.smallTSBasic.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                VerticalPadding(
                  percentage: 0.1,
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        width: width,
                        height: height * 0.7,
                        child: PageView(
                          controller: controller,
                          onPageChanged: _onPageViewChange,
                          scrollDirection: Axis.horizontal,
                          // physics: BouncingScrollPhysics(),
                          children: categories
                              .map((media) => ItemSliderWidget(
                                    onPick: _onPickItem,
                                    interests: media.interests ?? [],
                                    width: width,
                                    selectedInterests:
                                        selectedInterests.toList(),
                                    height: height * 0.7,
                                  ))
                              .toList(),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              "What are you into?",
                              style: appTextStyle.bigTSBasic.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          VerticalPadding(
                            percentage: 0.06,
                          ),
                          Container(
                            child: Text(
                              "Pick at least 5",
                              style: appTextStyle.minTSBasic.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          VerticalPadding(
                            percentage: 0.02,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalPadding(
                  percentage: 0.05,
                ),
                Container(
                  width: width,
                  alignment: AlignmentDirectional.center,
                  child: MediaProfileIndicatorWidget(
                      controller: controller,
                      width: width * .8,
                      onDotClicked: _onPageViewChange,
                      count: categories.length),
                ),
                VerticalPadding(
                  percentage: 0.05,
                ),
                Container(
                    width: width,
                    alignment: AlignmentDirectional.center,
                    child: ButtonUserManagementWidget(
                      width: width * .8,
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
                      onPressed: () {
                        if (selectedInterests.length >= 5) {
                          Navigator.of(context)
                              .pushNamed(Routes.userDetailsPage);
                        } else {
                          AppUtils.showSnackBar(
                              context: context,
                              message: "You have to pick 5 item at least");
                        }
                      },
                      child: Center(
                        child: Text(
                          "Continue".toUpperCase(),
                          style: appTextStyle.smallTSBasic
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    )),
                VerticalPadding(
                  percentage: 0.05,
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Column(
                children: [
                  VerticalPadding(
                    percentage: 0.09,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.space20),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    categoryIndex = page;
    if (mounted) setState(() {});
    controller.jumpToPage(page);
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

  _onPickItem(CategoryInterestItemModel item, bool value) {
    if (value) {
      selectedInterests.add(item);
    } else {
      selectedInterests.removeWhere((old) => old.sId == item.sId);
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _cancelToken.cancel();
    super.dispose();
  }
}
