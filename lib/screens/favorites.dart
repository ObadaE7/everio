import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:everio/widgets/product_card.dart';
import 'package:everio/widgets/simple_category.dart';
import 'package:everio/data/dummy_data.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.kPaddingNormal),
        child: Column(
          children: [
            const SimpleCategoryCard(),
            const SizedBox(height: AppSizes.kPaddingNormal),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dummyClothes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppSizes.kPaddingNormal,
                mainAxisSpacing: AppSizes.kPaddingNormal,
                mainAxisExtent: 280.0,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  clothe: dummyClothes[index],
                  imagePath: dummyClothes[index].imageUrl,
                  productName: dummyClothes[index].name,
                  productPrice: dummyClothes[index].price.toString(),
                  height: 280.0,
                  isFavorite: true,
                  enableFavorite: true,
                  rating: dummyClothes[index].rating,
                  productNameSize: 20.0,
                  productPriceSize: 18.0,
                  imageHeight: 150.0,
                  onFavoriteToggle: () {},
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.lightBackgroundColor,
    );
  }
}
