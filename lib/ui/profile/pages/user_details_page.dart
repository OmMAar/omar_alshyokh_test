import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:omar_alshyokh_test/common/users/user_grid_view_with_filter_pagination.dart';
import 'package:omar_alshyokh_test/common/widgets/vertical_padding.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/ui/profile/widgets/profile_info_widget.dart';
import 'package:omar_alshyokh_test/utils/device/device_utils.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage>
    with SingleTickerProviderStateMixin {
  // //stores:---------------------------------------------------------------------

  var _cancelToken = CancelToken();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();


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
        child: ProfileInfoWidget(height: heightC,width: widthC,)
      ),
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

}
