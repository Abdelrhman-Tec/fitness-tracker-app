import 'package:fitness_trainer_app/core/constants/app_assets.dart';
import 'package:fitness_trainer_app/core/constants/app_strings.dart';
import 'package:fitness_trainer_app/core/helpers/spacing.dart';
import 'package:fitness_trainer_app/core/themeing/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeBack,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.gray2,
              ),
            ),
            verticalSpace(5),
            Text(
              'User',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.gray4,
          child: SvgPicture.asset(AppAssets.notificationIcon, width: 25),
        ),
      ],
    );
  }
}
