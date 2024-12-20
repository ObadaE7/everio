import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:everio/widgets/input_field.dart';
import 'package:everio/screens/tabs.dart';
import 'package:everio/data/dummy_data.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.kPaddingNormal),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: AppColors.secondaryDark,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
                Form(
                  key: widget._formKey,
                  child: Column(
                    children: [
                      InputField(
                        field: 'Email',
                        hintText: 'Enter your email',
                        initialValue: dummyUser[0].email,
                        prefixIcon: HugeIcons.strokeRoundedMail02,
                        autoValidate: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: AppSizes.kPaddingNormal),
                      InputField(
                        field: 'Password',
                        hintText: 'Enter your password',
                        isPassword: true,
                        prefixIcon: HugeIcons.strokeRoundedLockPassword,
                        autoValidate: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must contain at least one lowercase letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one digit';
                          }
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: AppColors.primaryGreen,
                                checkColor: Colors.white,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                side: const BorderSide(
                                  color: AppColors.primaryGreen,
                                ),
                                value: true,
                                onChanged: (value) {},
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: AppColors.secondaryDark,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColors.secondaryDark,
                                fontSize: 16.0,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget._formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabsScreen(),
                                ),
                              );
                            }
                          },
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.primaryGreen,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                horizontal: 40.0,
                                vertical: 16.0,
                              ),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                            ),
                            textStyle: WidgetStatePropertyAll(
                              TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          child: const Text('Sign In'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.0,
                      child: Divider(),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Or sign up with',
                      style: TextStyle(
                        color: AppColors.secondaryDark,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    SizedBox(
                      width: 100.0,
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: AppColors.primaryGreen.withOpacity(.2),
                      child: const HugeIcon(
                        icon: HugeIcons.strokeRoundedGoogle,
                        color: AppColors.primaryDark,
                        size: 35.0,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: AppColors.primaryGreen.withOpacity(.2),
                      child: const HugeIcon(
                        icon: HugeIcons.strokeRoundedFacebook02,
                        color: AppColors.primaryDark,
                        size: 35.0,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: AppColors.primaryGreen.withOpacity(.2),
                      child: const HugeIcon(
                        icon: HugeIcons.strokeRoundedApple,
                        color: AppColors.primaryDark,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: AppColors.secondaryDark,
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColors.primaryGreen,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: -175,
              right: -207,
              child: Container(
                width: 342,
                height: 342,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryGreen.withOpacity(.2),
                ),
              ),
            ),
            Positioned(
              top: -210,
              right: -37,
              child: Container(
                width: 445,
                height: 406,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryGreen.withOpacity(.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
