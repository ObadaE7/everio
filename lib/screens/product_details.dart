import 'package:flutter/material.dart';
import 'package:everio/models/clothe.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:everio/widgets/draggable_sheet.dart';
import 'package:everio/widgets/quantity_selector.dart';
import 'package:everio/widgets/review_indicator.dart';
import 'package:iconly/iconly.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Clothe clothe;
  const ProductDetailsScreen({super.key, required this.clothe});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFavorite = false;
  bool isExpanded = false;
  bool isPanelExpanded = false;
  Color? _selectedColor;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            HugeIcons.strokeRoundedArrowLeft04,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Details',
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryGreen.withOpacity(.2),
              ),
              child: IconButton(
                icon: Icon(
                  IconlyBold.heart,
                  color: isFavorite ? AppColors.primaryGreen : Colors.white70,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ),
          ),
        ],
        backgroundColor: AppColors.lightBackgroundColor,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.clothe.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          DraggableSheet(
            initialChildSize: 0.54,
            minChildSize: 0.54,
            maxChildSize: 0.85,
            draggableSheetBody: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.clothe.category,
                      style: const TextStyle(
                        fontSize: AppSizes.kTextSubheading,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    const Text(
                      'In Stock',
                      style: TextStyle(
                        fontSize: AppSizes.kTextSubheading - 2.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.clothe.name,
                  style: const TextStyle(
                    fontSize: AppSizes.kTextHeading + 4.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(height: AppSizes.kPaddingSmall),
                Text(
                  widget.clothe.description,
                  maxLines: isExpanded ? null : 3,
                  overflow:
                      isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: AppSizes.kTextSubheading - 2.0,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? "Read Less" : "Read More",
                    style: const TextStyle(
                      fontSize: AppSizes.kTextSubheading - 2.0,
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryGreen,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.clothe.price}',
                      style: const TextStyle(
                        fontSize: AppSizes.kTextHeading + 6.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryDark,
                      ),
                    ),
                    QuantitySelector(
                      quantity: _quantity,
                      onIncrease: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      onDecrease: () {
                        setState(() {
                          _quantity--;
                        });
                      },
                      isQuantityGreaterThanZero: _quantity > 1 ? true : false,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.kPaddingSmall,
                  ),
                  child: Divider(),
                ),
                const Text(
                  'Select Size',
                  style: TextStyle(
                    fontSize: AppSizes.kTextSubheading,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.kPaddingSmall),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.clothe.sizes.map((size) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.kPaddingNormal,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: size == 'M'
                            ? AppColors.primaryGreen
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          AppSizes.kBorderRadiusNormal,
                        ),
                        border: Border.all(
                          color: size == 'M'
                              ? AppColors.primaryGreen
                              : Colors.grey,
                        ),
                      ),
                      child: Text(
                        size,
                        style: TextStyle(
                          fontSize: AppSizes.kTextSubheading,
                          color: size == 'M' ? Colors.white : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
                const Text(
                  'Select Color',
                  style: TextStyle(
                    fontSize: AppSizes.kTextSubheading,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.kPaddingSmall),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.clothe.colors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = color;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: color,
                        child: _selectedColor == color
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20.0,
                              )
                            : null,
                      ),
                    );
                  }).toList(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.kPaddingSmall,
                  ),
                  child: Divider(),
                ),
                const Text(
                  'Ratings & Reviews',
                  style: TextStyle(
                    fontSize: AppSizes.kTextSubheading,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Text(
                                '${widget.clothe.rating}',
                                style: const TextStyle(
                                  fontSize: AppSizes.kTextDisplay,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                              RatingBarIndicator(
                                itemCount: 5,
                                rating: widget.clothe.rating,
                                itemSize: 24.0,
                                unratedColor: AppColors.primaryLight,
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    IconlyBold.star,
                                    color: Colors.amber,
                                  );
                                },
                              ),
                              const Text(
                                '89 Ratings',
                                style: TextStyle(
                                  fontSize: AppSizes.kTextSmall,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: AppSizes.kPaddingLarge),
                        const Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              ReviewIndicator(text: '5', value: 1.0),
                              ReviewIndicator(text: '4', value: 0.8),
                              ReviewIndicator(text: '3', value: 0.6),
                              ReviewIndicator(text: '2', value: 0.4),
                              ReviewIndicator(text: '1', value: 0.2),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.kPaddingNormal),
                    const Text(
                      'See all reviews',
                      style: TextStyle(
                        fontSize: AppSizes.kTextSubheading,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.kPaddingExtraLarge,
        ),
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Cost',
                  style: TextStyle(
                    fontSize: AppSizes.kTextSubheading,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$${(widget.clothe.price * _quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: AppSizes.kTextHeading,
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(AppSizes.kPaddingNormal),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(
                  AppSizes.kBorderRadiusLarge,
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    HugeIcons.strokeRoundedShoppingCart01,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  SizedBox(width: AppSizes.kPaddingSmall),
                  Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: AppSizes.kTextHeading - 4.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.lightBackgroundColor,
    );
  }
}
