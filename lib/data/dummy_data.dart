import 'package:flutter/material.dart';
import 'package:everio/models/category.dart';
import 'package:everio/models/clothe.dart';
import 'package:hugeicons/hugeicons.dart';

const dummyCategories = [
  Category(
    id: 1,
    name: 'All Items',
    icon: HugeIcons.strokeRoundedDashboardSquare02,
  ),
  Category(
    id: 2,
    name: 'Hoodies',
    icon: HugeIcons.strokeRoundedHoodie,
  ),
  Category(
    id: 3,
    name: 'T-Shirts',
    icon: HugeIcons.strokeRoundedShirt01,
  ),
  Category(
    id: 4,
    name: 'Shirts',
    icon: HugeIcons.strokeRoundedTShirt,
  ),
  Category(
    id: 5,
    name: 'Pants',
    icon: HugeIcons.strokeRoundedJoggerPants,
  ),
  Category(
    id: 6,
    name: 'Glasses',
    icon: HugeIcons.strokeRoundedGlasses,
  ),
  Category(
    id: 7,
    name: 'Watches',
    icon: HugeIcons.strokeRoundedWatch01,
  ),
];

var dummyClothes = [
  Clothe(
    id: 1,
    category: dummyCategories[1].name,
    name: 'Men\'s Black Hoodie',
    description:
        'Experience ultimate comfort with this classic black hoodie, ideal for cooler days and casual outings. Crafted from a soft, high-quality blend of cotton and polyester, it provides warmth while being gentle on your skin. Featuring a spacious hood, ribbed cuffs, and a kangaroo pocket, it combines practicality with a sleek style. Perfect for layering or wearing on its own, this hoodie is a versatile addition to any wardrobe.',
    price: 29.99,
    imageUrl: 'assets/clothes/hoodies/hoodie-1.png',
    colors: [Colors.black, Colors.blue],
    sizes: ['M', 'L', 'XL'],
    createdAt: DateTime(2024, 10, 10),
    rating: 4.5,
  ),
  Clothe(
    id: 2,
    category: dummyCategories[3].name,
    name: 'Hawaiian Shirt Isolated',
    description:
        'Stand out in this vibrant Hawaiian shirt, perfect for warm-weather adventures and adding a pop of color to your look. Crafted from lightweight, breathable fabric, it features bold tropical patterns in green and yellow, evoking the spirit of the islands. Its short sleeves and relaxed fit make it an ideal choice for beach trips, barbecues, or any casual gathering. With this shirt, you’ll bring a touch of paradise wherever you go.',
    price: 59.99,
    imageUrl: 'assets/clothes/shirts/shirt-4.png',
    colors: [Colors.green, Colors.yellow],
    sizes: ['S', 'M', 'L'],
    createdAt: DateTime(2024, 9, 15),
    rating: 4.2,
  ),
  Clothe(
    id: 3,
    category: dummyCategories[2].name,
    name: 'Plain Dark Green T-shirt',
    description:
        'A versatile dark green t-shirt that’s perfect for any casual occasion, offering understated style and all-day comfort. Made from premium, breathable cotton, this tee is designed to be soft yet durable, making it a must-have for layering or as a standalone piece. Its minimalist design allows for endless outfit combinations, making it a reliable go-to in any wardrobe.',
    price: 19.99,
    imageUrl: 'assets/clothes/t-shirts/t-shirt-5.png',
    colors: [Colors.green, Colors.white],
    sizes: ['XS', 'S', 'M'],
    createdAt: DateTime(2024, 10, 25),
    rating: 4.8,
  ),
  Clothe(
    id: 4,
    category: dummyCategories[5].name,
    name: 'Light Green Sunglasses with Black Frame',
    description:
        'Make a statement with these trendy light green sunglasses, complemented by a bold black frame. Designed to offer UV protection, they keep your eyes safe from the sun while enhancing your outfit. The sleek design and lightweight build make them a comfortable, stylish accessory for any outdoor occasion, whether you\'re at the beach or just out for a stroll.',
    price: 4.99,
    imageUrl: 'assets/clothes/glasses/glasses-3.png',
    colors: [Colors.lightGreen, Colors.black],
    sizes: ['One Size'],
    createdAt: DateTime(2024, 12, 5),
    rating: 4.6,
  ),
  Clothe(
    id: 5,
    category: dummyCategories[6].name,
    name: 'Rolex Yacht-Master Watch',
    description:
        'Elevate your style with the Rolex Yacht-Master, a luxurious watch crafted for those who value sophistication. Featuring a striking silver finish with bold black accents, this timepiece is both durable and timeless, suitable for any formal occasion. Known for its precision and reliability, the Yacht-Master is a statement piece that embodies class and elegance.',
    price: 149.99,
    imageUrl: 'assets/clothes/watches/watch-2.png',
    colors: [Colors.grey, Colors.black],
    sizes: ['One Size'],
    createdAt: DateTime(2024, 10, 30),
    rating: 4.9,
  ),
  Clothe(
    id: 6,
    category: dummyCategories[4].name,
    name: 'Men\'s Cargo Pants',
    description:
        'Built for adventure, these brown cargo pants offer both durability and comfort. Ideal for outdoor activities, they feature multiple deep pockets for secure storage of your essentials, from your phone to tools or snacks. Made with resilient fabric, they provide a relaxed fit that allows for easy movement. Whether you’re hiking or running errands, these cargo pants are a reliable choice for an active lifestyle.',
    price: 30.99,
    imageUrl: 'assets/clothes/pants/pants-4.png',
    colors: const [Colors.brown, Colors.deepOrange],
    sizes: const ['M', 'L', 'XL'],
    createdAt: DateTime(2024, 1, 18),
    rating: 4.3,
  ),
];
