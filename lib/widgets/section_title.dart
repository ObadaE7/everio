import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool showSeeAll;

  const SectionTitle({
    super.key,
    required this.title,
    this.showSeeAll = false,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: AppSizes.kTextHeading - 2.0,
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (showSeeAll)
          const Text(
            'See All',
            style: TextStyle(
              fontSize: AppSizes.kTextSubheading,
              color: AppColors.primaryGreen,
            ),
          ),
      ],
    );
  }
}
