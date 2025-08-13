import 'package:fitness_trainer_app/core/constants/app_assets.dart';
import 'package:fitness_trainer_app/core/constants/app_strings.dart';
import 'package:fitness_trainer_app/core/helpers/extensions.dart';
import 'package:fitness_trainer_app/core/helpers/spacing.dart';
import 'package:fitness_trainer_app/core/routing/routes.dart';
import 'package:fitness_trainer_app/core/themeing/app_colors.dart';
import 'package:fitness_trainer_app/core/widgets/custom_button.dart';
import 'package:fitness_trainer_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreenTwo extends StatelessWidget {
  const RegisterScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                Image.asset(AppAssets.vectorSection, fit: BoxFit.cover),
                verticalSpace(20),
                Text(
                  AppStrings.completeProfile,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(5),
                Text(
                  AppStrings.itWillHelpUs,
                  style: TextStyle(fontSize: 14.sp, color: AppColors.gray1),
                ),
                verticalSpace(40),

                // Gender
                InputField(
                  hint: AppStrings.chooseGender,
                  iconPath: AppAssets.twoUserIcon,
                ),
                verticalSpace(15),

                // Date of Birth
                InputField(
                  hint: AppStrings.dateOfBirth,
                  iconPath: AppAssets.calendarIcon,
                ),
                verticalSpace(15),

                // Weight
                InputWithUnit(
                  hint: AppStrings.weight,
                  iconPath: AppAssets.weightIcon,
                  unit: AppStrings.kg,
                ),
                verticalSpace(15),

                // Height
                InputWithUnit(
                  hint: AppStrings.height,
                  iconPath: AppAssets.swapIcon,
                  unit: AppStrings.cm,
                ),

                verticalSpace(30),
                GradientButton(
                  width: double.infinity,
                  height: 60,
                  onPressed: () {
                    context.pushNamed(Routes.homeNavBar);
                  },
                  buttonName: AppStrings.next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hint;
  final String iconPath;
  final bool obscureText;
  final Widget? suffixIcon;

  const InputField({
    super.key,
    required this.hint,
    required this.iconPath,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      suffixIcon: suffixIcon,
      fillColor: AppColors.gray4,
      hint: hint,
      obscureText: obscureText,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(iconPath, width: 20, height: 20),
      ),
    );
  }
}

class InputWithUnit extends StatelessWidget {
  final String hint;
  final String iconPath;
  final String unit;

  const InputWithUnit({
    super.key,
    required this.hint,
    required this.iconPath,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputField(hint: hint, iconPath: iconPath),
        ),
        SizedBox(width: 8.w),
        _UnitBox(unit: unit),
      ],
    );
  }
}

class _UnitBox extends StatelessWidget {
  final String unit;

  const _UnitBox({required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        gradient: AppColors.purpleToPinkGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          unit,
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
