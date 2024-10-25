import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:flutter/material.dart';

class ReviewIndicator extends StatelessWidget {
  final String text;
  final double value;

  const ReviewIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: AppSizes.kTextSubheading,
              color: AppColors.primaryDark,
            ),
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11.0,
              color: AppColors.primaryGreen,
              backgroundColor: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0),
              valueColor: const AlwaysStoppedAnimation(AppColors.primaryGreen),
            ),
          ),
        ),
      ],
    );
  }
}
