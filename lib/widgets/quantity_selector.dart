import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class QuantitySelector extends StatefulWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final bool isQuantityGreaterThanZero;
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.isQuantityGreaterThanZero,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Decrease quantity',
          icon: Icon(
            HugeIcons.strokeRoundedMinusSign,
            color: widget.isQuantityGreaterThanZero
                ? AppColors.primaryDark
                : AppColors.primaryLight,
          ),
          onPressed:
              widget.isQuantityGreaterThanZero ? widget.onDecrease : null,
        ),
        Text(
          widget.quantity.toString(),
          style: const TextStyle(
            fontSize: AppSizes.kTextSubheading,
            color: AppColors.primaryDark,
          ),
        ),
        IconButton(
          tooltip: 'Increase quantity',
          icon: const Icon(
            HugeIcons.strokeRoundedPlusSign,
            color: AppColors.primaryDark,
          ),
          onPressed: widget.onIncrease,
        ),
      ],
    );
  }
}
