import 'package:everio/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:iconly/iconly.dart';
import 'package:hugeicons/hugeicons.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<IconData> drawerItemsIcon = [
    HugeIcons.strokeRoundedTruckDelivery,
    IconlyLight.filter,
    IconlyLight.logout,
  ];

  List<String> drawerItemsLabel = [
    'Orders',
    'Settings',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      backgroundColor: AppColors.secondaryGreen,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 120.0),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.kPaddingNormal,
                vertical: AppSizes.kPaddingExtraLarge * 2.0,
              ),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    dummyUser[0].name,
                    style: const TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: AppSizes.kTextHeading,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSizes.kPaddingNormal),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: drawerItemsIcon.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          drawerItemsIcon[index],
                          color: AppColors.primaryDark,
                        ),
                        title: Text(drawerItemsLabel[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 90.0,
            child: CircleAvatar(
              radius: 60.0,
              backgroundColor: AppColors.primaryGreen.withOpacity(.3),
            ),
          ),
          Positioned(
            top: 100.0,
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(dummyUser[0].imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
