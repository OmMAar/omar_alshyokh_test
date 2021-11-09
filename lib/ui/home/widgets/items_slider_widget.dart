import 'package:bubble_lens/bubble_lens.dart';
import 'package:flutter/material.dart';
import 'package:omar_alshyokh_test/models/category/category_interest_item_model.dart';
import 'package:omar_alshyokh_test/ui/home/widgets/item_interest.dart';

class ItemSliderWidget extends StatefulWidget {
  final List<CategoryInterestItemModel> interests;
  final List<CategoryInterestItemModel> selectedInterests;
  final double height;
  final double width;
  final Function(CategoryInterestItemModel, bool isSelected) onPick;

  const ItemSliderWidget(
      {required this.interests,
      required this.selectedInterests,
      required this.onPick,
      required this.height,
      required this.width});

  @override
  _ItemSliderWidgetState createState() => _ItemSliderWidgetState();
}

class _ItemSliderWidgetState extends State<ItemSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      // width:  widget.width,
      // height: widget.height,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        child: BubbleLens(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            highRatio: 2.2,
            lowRatio: 0.6,
            // paddingY: 100,

            widgets: widget.interests
                .map((interest) => InterestItem(
                      interest: interest,
                      onPick: widget.onPick,
                      initializeValue: _itemIsExist(interest.sId),
                    ))
                .toList()),
      ),
    );
  }

  bool _itemIsExist(String? itemId) {
    for (CategoryInterestItemModel item in widget.selectedInterests) {
      if (item.sId == itemId) return true;
    }
    return false;
  }
}
