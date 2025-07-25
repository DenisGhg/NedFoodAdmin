import 'package:flutter/material.dart';
import 'package:ned_food_admin/views/sizes/app_sizes.dart';

import '../colors/app_colors.dart';

class BodyWithBorderTopRadius extends StatelessWidget {
  final Widget? child;
  const BodyWithBorderTopRadius({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.screenHeight,
          width: context.screenWidth,
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(context.defaultPagePadding),
            decoration: BoxDecoration(
              color: AppColors.themeColor(context),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.referenceSize * 3),
                topRight: Radius.circular(context.referenceSize * 3),
              ),
            ),
            child: child, // ici tu avais mal fermé
          ),
        ),
      ],
    );
  }
}
