import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';

class PromotionBanner extends StatelessWidget {
  final String title;
  final String buttonText;
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;
  final double imageTopPosition;
  final double imageRightPosition;

  const PromotionBanner({
    super.key,
    required this.title,
    required this.buttonText,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    this.imageTopPosition = 0.0,
    this.imageRightPosition = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 170.0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.kPaddingNormal,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSizes.kBorderRadiusLarge,
            ),
            color: AppColors.secondaryLight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: AppSizes.kTextSubheading + 4.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.kPaddingNormal),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColors.primaryGreen,
                  ),
                  shadowColor: WidgetStatePropertyAll(
                    AppColors.primaryGreen.withOpacity(0.5),
                  ),
                  elevation: const WidgetStatePropertyAll(10.0),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSizes.kBorderRadiusLarge,
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.kTextSubheading,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: imageTopPosition,
          right: imageRightPosition,
          child: Image(
            image: AssetImage(imageUrl),
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
