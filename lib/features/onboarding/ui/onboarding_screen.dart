import 'dart:math';
import 'package:fitness_trainer_app/core/helpers/extensions.dart';
import 'package:fitness_trainer_app/core/helpers/spacing.dart';
import 'package:fitness_trainer_app/core/routing/routes.dart';
import 'package:fitness_trainer_app/core/themeing/app_colors.dart';
import 'package:fitness_trainer_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final int _totalOnboardingPages = OnboardingModel.onboardingList.length;
  final _controller = PageController();

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  double _currentProgress = 0.0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  void _updateProgress(int page) {
    setState(() {
      _currentPage = page;
      double newProgress = page / (_totalOnboardingPages - 1);
      _progressAnimation =
          Tween<double>(begin: _currentProgress, end: newProgress).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOut,
            ),
          );
      _currentProgress = newProgress;
      _animationController.forward(from: 0.0);
    });
  }

  void _nextPage() {
    if (_currentPage < _totalOnboardingPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.pushReplacementNamed(Routes.registerScreen);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: _updateProgress,
                itemBuilder: (context, index) {
                  final item = OnboardingModel.onboardingList[index];
                  return Column(
                    children: [
                      buildOnboardingImage(imagePath: item.imagePath),
                      verticalSpace(30),
                      buildTitleAndSubtitleSection(
                        title: item.title,
                        subtitle: item.subTitle,
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AnimatedBuilder(
                            animation: _progressAnimation,
                            builder: (context, _) {
                              return CircularNextButton(
                                onPressed: _nextPage,
                                progress: _progressAnimation.value,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: _totalOnboardingPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTitleAndSubtitleSection({required title, required subtitle}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 17.sp, color: AppColors.gray1),
          ),
        ),
      ),
    ],
  );
}

Widget buildOnboardingImage({required String imagePath}) {
  return Image.asset(imagePath, fit: BoxFit.cover, width: 375.w, height: 406.h);
}

class CircularNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  final double progress;

  const CircularNextButton({
    super.key,
    required this.onPressed,
    this.size = 80,
    this.progress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        painter: _GradientArcPainter(progress),
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          child: Container(
            width: size - 10,
            height: size - 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientArcPainter extends CustomPainter {
  final double progress;
  _GradientArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;

    final paint = Paint()
      ..shader = AppColors.blueToLinerGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
