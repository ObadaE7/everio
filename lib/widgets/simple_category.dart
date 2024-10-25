import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:everio/data/dummy_data.dart';

class SimpleCategoryCard extends StatefulWidget {
  const SimpleCategoryCard({super.key});

  @override
  State<SimpleCategoryCard> createState() => _SimpleCategoryCardState();
}

class _SimpleCategoryCardState extends State<SimpleCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dummyCategories.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(
            AppSizes.kPaddingSmall + 2.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primaryLight),
            borderRadius: BorderRadius.circular(
              AppSizes.kPaddingNormal,
            ),
          ),
          child: Row(
            children: [
              HugeIcon(
                icon: dummyCategories[index].icon,
                color:
                    index == 0 ? AppColors.primaryGreen : AppColors.primaryDark,
              ),
              const SizedBox(width: 10.0),
              Text(
                dummyCategories[index].name,
                style: TextStyle(
                  fontSize: AppSizes.kTextSubheading + 2.0,
                  color: index == 0
                      ? AppColors.primaryGreen
                      : AppColors.primaryDark,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: AppSizes.kPaddingNormal,
          );
        },
      ),
    );
  }
}
