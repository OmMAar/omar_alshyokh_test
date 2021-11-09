import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/models/category/category_interest_item_model.dart';
import 'package:omar_alshyokh_test/utils/device/app_uitls.dart';

class InterestItem extends StatefulWidget {
  final CategoryInterestItemModel interest;
  final bool initializeValue;
  final Function(CategoryInterestItemModel, bool isSelected) onPick;

  const InterestItem(
      {required this.interest,
      required this.onPick,
      this.initializeValue = false});

  @override
  _InterestItemState createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem> {
  bool isPicked = false;

  @override
  void initState() {
    isPicked = widget.initializeValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (mounted)
          setState(() {
            isPicked = !isPicked;
          });
        widget.onPick(widget.interest, isPicked);
      },
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
        ),
        child: Stack(
          children: [
            Container(
                child: Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: AppUtils.notNullOrEmpty(widget.interest.image)
                        ? "https://api.zipconnect.app/img/interests/${widget.interest.image}"
                        : ""),
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
            isPicked
                ? Container(
                    color: AppColors.mainGreen.withOpacity(0.2),
                    child: Center(
                      child: Icon(
                        Icons.check_outlined,
                        size: 20,
                        color: AppColors.white,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
