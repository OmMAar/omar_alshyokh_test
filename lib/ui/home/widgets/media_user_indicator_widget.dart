import 'package:flutter/material.dart';
import 'package:omar_alshyokh_test/constants/app_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MediaProfileIndicatorWidget extends StatelessWidget {
  final double width;
  final int count;
  final double? spacing;
  final double? radius;
  final double? dotWidth;
  final double? dotHeight;
  final PageController controller;
  final Function(int) onDotClicked;

  const MediaProfileIndicatorWidget(
      {required this.width,
      required this.onDotClicked,
      required this.count,
      required this.controller,
      this.radius,
      this.dotHeight,
      this.dotWidth,
      this.spacing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: AlignmentDirectional.center,
      child: SmoothPageIndicator(
          controller: controller, //// PageController
          count: count,
          effect: WormEffect(
            spacing: spacing ?? 0.0,
            radius: radius ?? 0.0,
            dotWidth: dotWidth ?? .0,
            dotHeight: dotHeight ?? 4.0,
            dotColor: Colors.grey,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 2,
            activeDotColor: AppColors.white,
          ), // your preferred effect
          onDotClicked: onDotClicked),
    );
  }
}
