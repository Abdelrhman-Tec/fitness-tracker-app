import 'package:fitness_trainer_app/core/constants/app_assets.dart';
import 'package:fitness_trainer_app/core/constants/app_strings.dart';
import 'package:fitness_trainer_app/core/helpers/extensions.dart';
import 'package:fitness_trainer_app/core/helpers/spacing.dart';
import 'package:fitness_trainer_app/core/routing/routes.dart';
import 'package:fitness_trainer_app/core/themeing/app_colors.dart';
import 'package:fitness_trainer_app/core/widgets/custom_button.dart';
import 'package:fitness_trainer_app/core/widgets/custom_text_form_field.dart';
import 'package:fitness_trainer_app/features/auth/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool _isObscure = true;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                HeaderTexts(
                  title: AppStrings.heythere,
                  subtitle: AppStrings.createanAccount,
                ),
                verticalSpace(40),

                // First Name
                _buildInputField(
                  hint: AppStrings.firstName,
                  iconPath: AppAssets.profileIcon,
                ),
                verticalSpace(15),

                // Last Name
                _buildInputField(
                  hint: AppStrings.lastName,
                  iconPath: AppAssets.profileIcon,
                ),
                verticalSpace(15),

                // Email
                _buildInputField(
                  hint: AppStrings.email,
                  iconPath: AppAssets.emailIcon,
                ),
                verticalSpace(15),

                // Password
                _buildInputField(
                  hint: AppStrings.password,
                  iconPath: AppAssets.lockIcon,
                  obscureText: _isObscure,
                  suffixIcon: _buildPasswordVisibilityIcon(),
                ),
                verticalSpace(170),

                GradientButton(
                  width: double.infinity,
                  height: 60,
                  onPressed: () {
                    context.pushNamed(Routes.registerScreenTwo);
                  },
                  buttonName: AppStrings.register,
                ),
                _AlreadyHaveAccount(onLoginTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String hint,
    required String iconPath,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
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

  Widget _buildPasswordVisibilityIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
      child: Icon(
        _isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
      ),
    );
  }
}

class _AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback onLoginTap;

  const _AlreadyHaveAccount({required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          AppStrings.alreadyHaveAccount,
          style: TextStyle(fontSize: 14, color: AppColors.gray2),
        ),
        GestureDetector(
          onTap: onLoginTap,
          child: const Text(
            AppStrings.login,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryBrand,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
