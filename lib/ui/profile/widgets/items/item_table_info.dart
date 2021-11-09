import 'package:flutter/material.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:omar_alshyokh_test/ui/profile/widgets/profile_info_widget.dart';

class ItemTableInfo extends StatelessWidget {
  final List<ItemInfoMock> items;
  final double width;

  const ItemTableInfo({required this.width, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cardBG.withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.radius16))),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(AppDimens.space18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: width * 0.4),
                      child: Text(
                        items[index].title,
                        style: appTextStyle.middleTSBasic
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: width * 0.4),
                      child: Text(
                        items[index].value,
                        style: appTextStyle.middleTSBasic.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, int) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.space4),
                child: Divider(
                  height: 0,
                  thickness: 1.5,
                  color: AppColors.dividerColor.withOpacity(0.2),
                ),
              );
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length),
      ),
    );
  }
}
