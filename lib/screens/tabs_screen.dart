import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:everio/widgets/main_drawer.dart';
import 'package:everio/screens/home_screen.dart';
import 'package:everio/screens/cart_screen.dart';
import 'package:everio/screens/favorites_screen.dart';
import 'package:everio/screens/profile_screen.dart';
import 'package:everio/data/dummy_data.dart';
import 'package:iconly/iconly.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  int _currentScreenIndex = 0;
  late MotionTabBarController _motionTabBarController;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  final List<String> _screenTitles = [
    'Hello, Obada',
    'Cart',
    'Favorites',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: _currentScreenIndex,
      length: _screens.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController.dispose();
    super.dispose();
  }

  List<Widget> _buildAppBarActions() {
    if (_currentScreenIndex == 0) {
      return [
        _buildBadgeAction(
          icon: IconlyLight.notification,
          count: '0',
        ),
      ];
    } else if (_currentScreenIndex == 1 || _currentScreenIndex == 2) {
      return [
        IconButton(
          icon: const Icon(
            IconlyLight.filter,
            color: AppColors.primaryDark,
          ),
          onPressed: () {},
        ),
        _buildBadgeAction(
          icon: _currentScreenIndex == 1
              ? HugeIcons.strokeRoundedShoppingCart01
              : IconlyLight.heart,
          count: dummyClothes.length.toString(),
          badgeColor: AppColors.primaryGreen,
        ),
      ];
    } else {
      return [];
    }
  }

  Widget _buildBadgeAction({
    required IconData icon,
    required String count,
    Color badgeColor = AppColors.primaryDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.kPaddingNormal),
      child: Badge(
        offset: const Offset(0.0, -2.0),
        label: Text(
          count,
          style: const TextStyle(
            color: AppColors.secondaryLight,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: badgeColor,
        child: Icon(
          icon,
          color: AppColors.primaryDark,
          size: 30.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => widget._scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(
            HugeIcons.strokeRoundedMenu02,
            color: AppColors.primaryDark,
          ),
        ),
        title: Text(
          _screenTitles[_currentScreenIndex],
          style: TextStyle(
            fontSize: _currentScreenIndex == 0 ? 18.0 : 22.0,
            color: AppColors.primaryDark,
          ),
        ),
        actions: _buildAppBarActions(),
        backgroundColor:
            _currentScreenIndex == 0 ? AppColors.primaryGreen : Colors.white,
      ),
      body: _screens[_currentScreenIndex],
      drawer: const MainDrawer(),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const ["Home", "Cart", "Favorites", "Profile"],
        icons: const [
          IconlyLight.home,
          HugeIcons.strokeRoundedShoppingCart01,
          IconlyLight.heart,
          IconlyLight.profile,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: AppColors.primaryGreen,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: AppColors.primaryGreen,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _currentScreenIndex = value;
            _motionTabBarController.index = value;
          });
        },
      ),
    );
  }
}
