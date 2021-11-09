import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';

class ItemCircleButton extends StatelessWidget {
  final double size;
  final double radius;
  final String svgIcon;
  const ItemCircleButton({required this.size,required this.svgIcon,required this.radius});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.mainEndBG.withOpacity(0.9),
        gradient: LinearGradient(
            colors: [
              Color(0xff042093).withOpacity(0.9),
              Color(0xff042093).withOpacity(0.9),

              AppColors.transparent,
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter),
      ),
      child: Center(
        child: SvgPicture.asset(
          svgIcon,
          width: size,
          height: size,
          color: AppColors.white,
        ),
      ),
    );
  }
}
