import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:everio/widgets/draggable_sheet.dart';
import 'package:everio/widgets/quantity_selector.dart';
import 'package:everio/data/dummy_data.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:dotted_line/dotted_line.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double _discountPercentage = 10;
  final List<int> _quantities = List<int>.generate(
    dummyClothes.length,
    (index) => 1,
  );

  double _calculateTotal() {
    double total = 0;
    for (int i = 0; i < dummyClothes.length; i++) {
      total += dummyClothes[i].price * _quantities[i];
    }
    return total;
  }

  double _calculateDiscount() {
    double total = _calculateTotal();
    return total * (_discountPercentage / 100);
  }

  double _calculateTotalWithDiscount() {
    double total = _calculateTotal();
    double discountAmount = _calculateDiscount();
    return total - discountAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 130.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSizes.kPaddingNormal),
                  child: ListView.builder(
                    itemCount: dummyClothes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      bool isQuantityGreaterThanZero =
                          _quantities[index] > 1 ? true : false;
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSizes.kPaddingNormal,
                        ),
                        child: Dismissible(
                          key: UniqueKey(),
                          // key: Key(index.toString()),
                          onDismissed: (direction) {
                            setState(() {});
                          },
                          background: Container(
                            padding: const EdgeInsets.only(
                              right: AppSizes.kPaddingLarge,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSizes.kBorderRadiusNormal,
                              ),
                              color: Colors.red,
                            ),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                HugeIcons.strokeRoundedDelete02,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(
                              AppSizes.kPaddingSmall,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen.withOpacity(.1),
                              borderRadius: BorderRadius.circular(
                                AppSizes.kBorderRadiusNormal,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  padding: const EdgeInsets.all(
                                      AppSizes.kPaddingSmall),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.kBorderRadiusNormal,
                                    ),
                                    color: Colors.white.withOpacity(.7),
                                  ),
                                  child: Image.asset(
                                    dummyClothes[index].imageUrl,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: AppSizes.kPaddingNormal),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        dummyClothes[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: AppSizes.kTextSubheading,
                                          color: AppColors.primaryDark,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: AppSizes.kPaddingNormal),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '\$${dummyClothes[index].price}',
                                                style: TextStyle(
                                                  fontSize:
                                                      isQuantityGreaterThanZero
                                                          ? AppSizes.kTextSmall
                                                          : AppSizes
                                                              .kTextSubheading,
                                                  color:
                                                      isQuantityGreaterThanZero
                                                          ? AppColors
                                                              .primaryDark
                                                          : AppColors
                                                              .primaryGreen,
                                                  decoration:
                                                      isQuantityGreaterThanZero
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : null,
                                                ),
                                              ),
                                              if (isQuantityGreaterThanZero)
                                                Text(
                                                  '\$${(dummyClothes[index].price * _quantities[index]).toStringAsFixed(2)}',
                                                  style: const TextStyle(
                                                    fontSize: AppSizes
                                                        .kTextSubheading,
                                                    color:
                                                        AppColors.primaryGreen,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSizes.kBorderRadiusNormal,
                                              ),
                                              color:
                                                  Colors.white.withOpacity(.7),
                                            ),
                                            child: QuantitySelector(
                                              quantity: _quantities[index],
                                              onIncrease: () {
                                                setState(() {
                                                  _quantities[index]++;
                                                });
                                              },
                                              onDecrease: () {
                                                setState(() {
                                                  _quantities[index]--;
                                                });
                                              },
                                              isQuantityGreaterThanZero:
                                                  isQuantityGreaterThanZero,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          DraggableSheet(
            initialChildSize: 0.18,
            minChildSize: 0.18,
            maxChildSize: 0.43,
            draggableSheetBody: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sub-Total',
                      style: TextStyle(
                        fontSize: AppSizes.kTextSubheading + 2.0,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    Text(
                      '\$${_calculateTotal().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: AppSizes.kTextSubheading + 2.0,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Discount',
                      style: TextStyle(
                        fontSize: AppSizes.kTextSubheading + 2.0,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    Text(
                      '-\$${_calculateDiscount().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: AppSizes.kTextSubheading + 2.0,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.kPaddingNormal,
                  ),
                  child: DottedLine(
                    dashColor: AppColors.primaryGreen,
                    dashGapLength: 5.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Cost',
                      style: TextStyle(
                        fontSize: AppSizes.kTextSubheading + 2.0,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    Text(
                      '\$${_calculateTotalWithDiscount().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: AppSizes.kTextSubheading + 2.0,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.kPaddingNormal),
                MaterialButton(
                  color: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSizes.kBorderRadiusNormal,
                    ),
                  ),
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.kPaddingNormal),
                  onPressed: () {},
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: AppSizes.kTextSubheading + 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightBackgroundColor,
    );
  }
}
