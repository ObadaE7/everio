import 'package:flutter/material.dart';
import 'package:everio/utils/colors.dart';
import 'package:everio/utils/sizes.dart';
import 'package:everio/widgets/product_card.dart';
import 'package:everio/widgets/simple_category.dart';
import 'package:everio/widgets/promotion_banner.dart';
import 'package:everio/widgets/section_title.dart';
import 'package:everio/data/dummy_data.dart';
import 'package:iconly/iconly.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _carouselSliderIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  late List<bool> isFavoriteList;

  final List<Widget> _carouselItems = [
    const PromotionBanner(
      title: 'Get your special sale up to 50%',
      buttonText: 'Grab It Now',
      imageUrl: 'assets/illustrations/sale-50.png',
      imageTopPosition: -50,
      imageRightPosition: -70,
      imageWidth: 300,
      imageHeight: 250,
    ),
    const PromotionBanner(
      title: 'New fall jackets collection',
      buttonText: 'Explore Now',
      imageUrl: 'assets/illustrations/jackets-collection.png',
      imageTopPosition: -60,
      imageRightPosition: -45,
      imageWidth: 300,
      imageHeight: 250,
    ),
    const PromotionBanner(
      title: 'Refer a friend & Earn rewards',
      buttonText: 'Invite Now',
      imageUrl: 'assets/illustrations/gift-box-rewards.png',
      imageTopPosition: -30,
      imageWidth: 200,
      imageHeight: 200,
    ),
  ];

  @override
  void initState() {
    super.initState();
    isFavoriteList = List<bool>.filled(dummyClothes.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180.0,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.kPaddingNormal,
                    vertical: AppSizes.kPaddingSmall,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryGreen,
                        AppColors.secondaryGreen,
                      ],
                    ),
                  ),
                  child: TextField(
                    cursorColor: AppColors.primaryDark,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        IconlyLight.search,
                        color: AppColors.primaryDark.withOpacity(0.5),
                      ),
                      suffixIcon: const Icon(
                        IconlyLight.filter,
                        color: AppColors.primaryDark,
                      ),
                      hintText: 'What are you looking for today?',
                      hintStyle: TextStyle(
                        fontSize: AppSizes.kTextBody,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryDark.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: AppColors.secondaryGreen.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(AppSizes.kBorderRadiusLarge),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -80.0,
                  left: AppSizes.kPaddingNormal,
                  right: AppSizes.kPaddingNormal,
                  child: CarouselSlider(
                    items: _carouselItems,
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      clipBehavior: Clip.none,
                      height: 170.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      autoPlayInterval: const Duration(seconds: 10),
                      onPageChanged: (index, _) {
                        setState(() {
                          _carouselSliderIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselItems.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    _carouselController.animateToPage(entry.key);
                  },
                  child: Container(
                    width: entry.key == _carouselSliderIndex ? 20.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSizes.kBorderRadiusNormal),
                      color: entry.key == _carouselSliderIndex
                          ? AppColors.primaryGreen
                          : AppColors.primaryLight,
                    ),
                  ),
                );
              }).toList(), // Ensure the result of .map() is converted to a List<Widget>
            ),
            const SizedBox(height: AppSizes.kPaddingNormal),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.kPaddingNormal,
              ),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'Discover Our Top Picks',
                    showSeeAll: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.kPaddingNormal,
                    ),
                    child: SimpleCategoryCard(),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        dummyClothes.length <= 4 ? dummyClothes.length : 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                        enableNewBadge: DateTime.now()
                                .difference(dummyClothes[index].createdAt)
                                .inDays <=
                            30,
                        rating: dummyClothes[index].rating,
                        productNameSize: 20.0,
                        productPriceSize: 18.0,
                        enableFavorite: true,
                        imageHeight: 150.0,
                        isFavorite: isFavoriteList[index],
                        onFavoriteToggle: () {
                          setState(() {
                            isFavoriteList[index] = !isFavoriteList[index];
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: AppSizes.kPaddingNormal),
                  Column(
                    children: [
                      const SectionTitle(title: 'New Arrivals'),
                      const SizedBox(height: AppSizes.kPaddingNormal),
                      SizedBox(
                        height: 250.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyClothes.length,
                          itemBuilder: (context, index) => ProductCard(
                            clothe: dummyClothes[index],
                            imagePath: dummyClothes[index].imageUrl,
                            productName: dummyClothes[index].name,
                            productPrice: dummyClothes[index].price.toString(),
                            imageHeight: 130.0,
                            enableNewBadge: DateTime.now()
                                    .difference(dummyClothes[index].createdAt)
                                    .inDays <=
                                30,
                            rating: dummyClothes[index].rating,
                            width: 150.0,
                          ),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: AppSizes.kPaddingNormal,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.kPaddingNormal),
          ],
        ),
      ),
      backgroundColor: AppColors.lightBackgroundColor,
    );
  }
}
