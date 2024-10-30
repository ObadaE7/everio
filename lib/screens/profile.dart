import 'package:everio/screens/account.dart';
import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Widget> _screens = [
    Account(),
  ];
  List<String> titles = [
    'Account',
    'Security',
    'Address',
    'Wallet',
    'Orders',
    'Settings',
    'Logout',
  ];

  List<String> subtitles = [
    'Update your name, email, and profilePage picture',
    'Change your password and set up security options',
    'Manage your shipping and billing addresses',
    'Manage your balance and payment options',
    'Track your recent and past purchases',
    'Customize your account preferences',
    'Logout of your account',
  ];

  List<IconData> icons = [
    IconlyLight.profile,
    HugeIcons.strokeRoundedLockPassword,
    IconlyLight.location,
    HugeIcons.strokeRoundedWallet02,
    HugeIcons.strokeRoundedTruckDelivery,
    IconlyLight.filter,
    IconlyLight.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 140.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primaryGreen,
                          AppColors.secondaryGreen,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -60.0,
                    left: -60.0,
                    child: _buildCirclePlaceholder(200.0, 200.0, 0.15),
                  ),
                  Positioned(
                    bottom: -50.0,
                    right: -40.0,
                    child: _buildCirclePlaceholder(150.0, 150.0, 0.2),
                  ),
                  Positioned(
                    top: 20.0,
                    right: 20.0,
                    child: _buildCirclePlaceholder(80.0, 80.0, 0.1),
                  ),
                  Positioned(
                    top: -30,
                    left: -30,
                    child: _buildCirclePlaceholder(100.0, 100.0, 0.3),
                  ),
                  Positioned(
                    bottom: -65.0,
                    left: 35.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(
                          color: Colors.white.withOpacity(.4),
                          width: 10.0,
                        ),
                      ),
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/avatars/avatar-1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: -45.0,
                    left: 165.0,
                    child: Text(
                      'Obada Daraghmeh',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: titles.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(icons[index]),
                        title: Text(titles[index]),
                        subtitle: Text(subtitles[index]),
                        trailing: const Icon(IconlyLight.arrow_right_2),
                        iconColor: AppColors.primaryGreen,
                        tileColor: AppColors.primaryGreen.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => _screens[index],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.lightBackgroundColor,
    );
  }

  Widget _buildCirclePlaceholder(double width, double height, double opacity) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}
