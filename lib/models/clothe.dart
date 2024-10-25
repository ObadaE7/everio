import 'package:flutter/material.dart';

class Clothe {
  final int id;
  final String category;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<Color> colors;
  final List<String> sizes;
  final DateTime createdAt;
  final double rating;

  const Clothe({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.colors,
    required this.sizes,
    required this.createdAt,
    required this.rating,
  });
}
