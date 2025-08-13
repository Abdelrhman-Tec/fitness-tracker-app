import 'package:fitness_trainer_app/core/routing/routes.dart';
import 'package:fitness_trainer_app/features/auth/ui/register_screen.dart';
import 'package:fitness_trainer_app/features/auth/ui/register_screen_two.dart';
import 'package:fitness_trainer_app/features/home/ui/home_screen.dart';
import 'package:fitness_trainer_app/features/home/widgets/home_nav_bar.dart';
import 'package:fitness_trainer_app/features/onboarding/ui/onboarding_screen.dart';
import 'package:fitness_trainer_app/features/profile/ui/profile_screen.dart';
import 'package:fitness_trainer_app/features/search/ui/search_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return _buildRoute(const HomeScreen(), settings);

      case Routes.registerScreen:
        return _buildRoute(const RegisterScreen(), settings);

      case Routes.registerScreenTwo:
        return _buildRoute(const RegisterScreenTwo(), settings);

      case Routes.onboardingScreen:
        return _buildRoute(const OnboardingScreen(), settings);

      case Routes.profileScreen:
        return _buildRoute(const ProfileScreen(), settings);
      case Routes.homeNavBar:
        return _buildRoute(const HomeNavBar(), settings);

      case Routes.searchScreen:
        return _buildRoute(const SearchScreen(), settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
