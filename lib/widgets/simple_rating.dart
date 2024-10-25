import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:hugeicons/hugeicons.dart';

class SimpleRating extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final bool hasReviews;
  const SimpleRating({
    super.key,
    required this.rating,
    this.reviewCount = 0,
    this.hasReviews = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          HugeIcons.strokeRoundedStar,
          color: Colors.amber,
          size: 20.0,
        ),
        const SizedBox(width: 5.0),
        Text(
          '$rating',
          style: const TextStyle(
            fontSize: AppSizes.kTextSubheading - 2,
            color: AppColors.primaryDark,
          ),
        ),
        if (hasReviews) const SizedBox(width: 5.0),
        if (hasReviews)
          Text(
            '($reviewCount Ratings)',
            style: const TextStyle(
              fontSize: AppSizes.kTextSubheading - 2,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
