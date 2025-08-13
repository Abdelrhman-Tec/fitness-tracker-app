import 'package:fitness_trainer_app/core/themeing/app_colors.dart';
import 'package:fitness_trainer_app/features/home/ui/home_screen.dart';
import 'package:fitness_trainer_app/features/profile/ui/profile_screen.dart';
import 'package:fitness_trainer_app/features/search/ui/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return const [HomeScreen(), SearchScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined, color: AppColors.gray3),
        inactiveIcon: const Icon(Icons.home, color: AppColors.secondary1),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search, color: AppColors.gray3),
        inactiveIcon: const Icon(Icons.search, color: AppColors.secondary1),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline, color: AppColors.gray3),
        inactiveIcon: const Icon(Icons.person, color: AppColors.secondary1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 145, 99, 253),
      navBarHeight: 50,

      decoration: NavBarDecoration(
        colorBehindNavBar: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
