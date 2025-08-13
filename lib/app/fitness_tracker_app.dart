import 'package:fitness_trainer_app/core/routing/app_router.dart';
import 'package:fitness_trainer_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          initialRoute: Routes.onboardingScreen,
        );
      },
    );
  }
}
