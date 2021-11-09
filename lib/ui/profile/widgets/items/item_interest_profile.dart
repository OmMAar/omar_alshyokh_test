import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/models/category/category_interest_item_model.dart';
import 'package:omar_alshyokh_test/utils/device/app_uitls.dart';

class InterestItemProfile extends StatefulWidget {
  final CategoryInterestItemModel interest;

  const InterestItemProfile(
      {required this.interest});

  @override
  _InterestItemProfileState createState() => _InterestItemProfileState();
}

class _InterestItemProfileState extends State<InterestItemProfile> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(130)),
      child: Container(
        width: 130,
        height: 130,
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
          shape: BoxShape.circle
        ),
        child: Stack(
          children: [
            Container(
                child: Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: widget.interest.image??"",width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                Container(
                  color: AppColors.mainStartBG.withOpacity(0.2),
                )
              ],
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimens.space20, horizontal: AppDimens.space20),
                child: Text(
                  widget.interest.name ?? "",
                  style:
                      appTextStyle.minTSBasic.copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
