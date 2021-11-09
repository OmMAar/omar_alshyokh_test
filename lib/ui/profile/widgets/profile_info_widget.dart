import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omar_alshyokh_test/common/widgets/vertical_padding.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/models/category/category_interest_item_model.dart';
import 'package:omar_alshyokh_test/ui/home/widgets/media_user_indicator_widget.dart';
import 'package:omar_alshyokh_test/ui/profile/widgets/items/item_circle_button.dart';
import 'package:omar_alshyokh_test/ui/profile/widgets/items/item_interest_profile.dart';
import 'package:omar_alshyokh_test/ui/profile/widgets/items/item_table_info.dart';
import 'package:omar_alshyokh_test/ui/user_management/widgets/button_user_management_widget.dart';
import 'package:omar_alshyokh_test/widgets/image/image_network_circle.dart';

class ProfileInfoWidget extends StatefulWidget {
  final double width;
  final double height;

  const ProfileInfoWidget({required this.height, required this.width});

  @override
  _ProfileInfoWidgetState createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {

  PageController controller =
  PageController(initialPage: 0, keepPage: true, viewportFraction: 1);


  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8];

  double radius = 125.0;

  List<String> _mediaList = [
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
  ];

  List<Widget> list() {
    final double firstItemAngle = pi;
    final double lastItemAngle = pi;
    final double angleDiff = (firstItemAngle + lastItemAngle) / 6;
    double currentAngle = firstItemAngle;

    return data.map((int index) {
      currentAngle += angleDiff;
      return ZoomIn(
          delay: Duration(milliseconds: 1900+100*index),
          child: _radialListItem(currentAngle, index));
    }).toList();
  }

  Widget _radialListItem(double angle, int index) {
    final x = cos(angle) * radius;
    final y = sin(angle) * radius;

    return Center(
      child: Transform(
          transform: index == 1
              ? Matrix4.translationValues(0.0, 0.0, 0.0)
              : Matrix4.translationValues(x, y, 0.0),
          child: Container(
            height: widget.width * .28,
            width: widget.width * .28,
            child: ClipRRect(
              child: InterestItemProfile(
                interest: CategoryInterestItemModel(
                    name: "Interest", image: "https://picsum.photos/200/300"),
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopWidget(
              height: widget.height * 0.7,
              width: widget.width,
            ),
            VerticalPadding(
              percentage: 0.05,
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1000),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: Text(
                  "Person Name, Age",
                  style: appTextStyle.middleTSBasic.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            VerticalPadding(
              percentage: 0.05,
            ),

            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.",
                  style:
                      appTextStyle.smallTSBasic.copyWith(color: AppColors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            VerticalPadding(
              percentage: 0.1,
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1200),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: Text(
                  "Basic Info",
                  style: appTextStyle.middleTSBasic.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            VerticalPadding(
              percentage: 0.05,
            ),

            ZoomIn(
              delay: Duration(milliseconds: 1300),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: ItemTableInfo(width: widget.width, items: [
                  ItemInfoMock(
                    value: "Omar",
                    title: "Name",
                  ),
                  ItemInfoMock(
                    value: "25",
                    title: "Gender",
                  ),
                  ItemInfoMock(
                    value: "25",
                    title: "Age",
                  ),
                  ItemInfoMock(
                    value: "Dubai",
                    title: "Location",
                  ),
                ]),
              ),
            ),

            VerticalPadding(
              percentage: 0.15,
            ),

            FadeInLeft(
              delay: Duration(milliseconds: 1400),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: Text(
                  "Personal Info",
                  style: appTextStyle.middleTSBasic.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            VerticalPadding(
              percentage: 0.05,
            ),
            ZoomIn(
              delay: Duration(milliseconds: 1500),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: ItemTableInfo(width: widget.width, items: [
                  ItemInfoMock(
                    value: "Women",
                    title: "Looking For",
                  ),
                  ItemInfoMock(
                    value: "Single",
                    title: "Relationship Status",
                  ),
                  ItemInfoMock(
                    value: "No",
                    title: "Kids",
                  ),
                  ItemInfoMock(
                    value: "Manager",
                    title: "Work Title",
                  ),
                  ItemInfoMock(
                    value: "Graduate",
                    title: "Education",
                  ),
                  ItemInfoMock(
                    value: "Brown",
                    title: "Hair Colour",
                  ),
                  ItemInfoMock(
                    value: "Brown",
                    title: "Eye Colour",
                  ),
                  ItemInfoMock(
                    value: "5 Ft",
                    title: "Height",
                  ),
                  ItemInfoMock(
                    value: "Asian",
                    title: "Ethnicity",
                  ),
                  ItemInfoMock(
                    value: "Christian",
                    title: "Religion",
                  ),
                ]),
              ),
            ),
            VerticalPadding(
              percentage: 0.1,
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1600),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: Text(
                  "100 Instagram Posts",
                  style: appTextStyle.middleTSBasic.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            VerticalPadding(
              percentage: 0.05,
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1700),
              child: Container(
                child: _buildGallery(items: [
                  "https://picsum.photos/200/300",
                  "https://picsum.photos/200/300",
                  "https://picsum.photos/200/300",
                  "https://picsum.photos/200/300",
                  "https://picsum.photos/200/300",
                ]),
              ),
            ),
            VerticalPadding(
              percentage: 0.1,
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1800),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space20),
                child: Text(
                  "Passions",
                  style: appTextStyle.middleTSBasic.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            VerticalPadding(
              percentage: 0.25,
            ),

            FadeInLeft(
              delay: Duration(milliseconds: 1900),
              child: Stack(children: list())),
            VerticalPadding(
              percentage: 0.35,
            ),
            ElasticInLeft(
              delay: Duration(milliseconds: 2000),
              child: Container(
                  width: widget.width,
                  alignment: AlignmentDirectional.center,
                  child: ButtonUserManagementWidget(
                    width: widget.width * .8,
                    height: 50,
                    backgroundColor: AppColors.reportButton,
                    borderRadius: 10,
                    borderColor: AppColors.transparent,
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "REPORT".toUpperCase(),
                        style: appTextStyle.smallTSBasic
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  )),
            ),
            VerticalPadding(
              percentage: 0.03,
            ),
            ElasticInRight(
              delay: Duration(milliseconds: 2000),
              child: Container(
                  width: widget.width,
                  alignment: AlignmentDirectional.center,
                  child: ButtonUserManagementWidget(
                    width: widget.width * .8,
                    height: 50,
                    backgroundColor: Color(0Xff2699FB).withOpacity(0.35),
                    borderRadius: 10,
                    borderColor: AppColors.transparent,
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "UNPAIR".toUpperCase(),
                        style: appTextStyle.smallTSBasic
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  )),
            ),
            VerticalPadding(
              percentage: 0.03,
            ),
            ElasticInLeft(
              delay: Duration(milliseconds: 2000),
              child: Container(
                  width: widget.width,
                  alignment: AlignmentDirectional.center,
                  child: ButtonUserManagementWidget(
                    width: widget.width * .8,
                    height: 50,
                    backgroundColor: Color(0XffDEDEDE).withOpacity(0.35),
                    borderRadius: 10,
                    borderColor: AppColors.transparent,
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "BLOCK".toUpperCase(),
                        style: appTextStyle.smallTSBasic
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  )),
            ),
            VerticalPadding(
              percentage: 0.1,
            ),
          ],
        ),
      ),
    );
  }

  _buildTopWidget({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: _mediaList
                  .map((media) => ImageNetworkCircleWidget(
                imageUrl: media,
                imageBorderRadius: 0.0,
                imageHeight: height ,
                imageWidth: width,
                boxFit: BoxFit.cover,
                indicatorSize: 35.0,
              ))
                  .toList(),
            ),
          ),

          Positioned(
            bottom: height*0.2,
            right: 20,
            child: Column(
              children: [
                FadeInRight(
                  child: ItemCircleButton(
                    radius: width*.12,
                    size: 20,
                    svgIcon: AppAssets.heart,
                  ),
                ),
                VerticalPadding(percentage: 0.04,),
                FadeInRight(
                  delay: Duration(milliseconds: 800),
                  child: ItemCircleButton(
                    radius: width*.12,
                    size: 20,
                    svgIcon: AppAssets.dislike,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: height*0.05,
            child: Container(
              alignment: AlignmentDirectional.center,
              child: MediaProfileIndicatorWidget(
                  controller: controller,
                  width: width,
                  radius: 6.0,
                  dotHeight: 6.0,
                  dotWidth: 6.0,
                  spacing: 8.0,
                  onDotClicked: (_){},
                  count: _mediaList.length),
            ),
          ),
        ],
      ),
    );
  }


  _buildGallery({required List<String> items}) {
    return Container(
      height: widget.height * 0.4,
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.space20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0),
            itemBuilder: (context, i) {
              return ImageNetworkCircleWidget(
                imageUrl: items[i],
                imageBorderRadius: AppRadius.radius16,
                imageHeight: 100,
                imageWidth: 100,
                boxFit: BoxFit.cover,
                indicatorSize: 35.0,
              );
            },
          )),
    );
  }
}

class ItemInfoMock {
  final String title;
  final String value;

  const ItemInfoMock({
    required this.value,
    required this.title,
  });
}
