import 'package:fitness_trainer_app/core/constants/app_assets.dart';
import 'package:fitness_trainer_app/core/constants/app_strings.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      imagePath: AppAssets.onboardingImage1,
      title: AppStrings.getBurn,
      subTitle: AppStrings.descriptionOnboarding1,
    ),
    OnboardingModel(
      imagePath: AppAssets.onboardingImage2,
      title: AppStrings.eatWell,
      subTitle: AppStrings.descriptionOnboarding2,
    ),
    OnboardingModel(
      imagePath: AppAssets.onboardingImage3,
      title: AppStrings.improveSleepQuality,
      subTitle: AppStrings.descriptionOnboarding3,
    ),
  ];
}
