import 'package:flutter/material.dart';

class RecipeModel {
  final String image;
  final String foodName;
  final String cal;
  final String time;

  RecipeModel({
    required this.image,
    required this.foodName,
    required this.cal,
    required this.time,
  });

  // Method to return the image widget with a circular border
  Widget getImageWithBorder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100), // Circular border radius
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white // Border color for dark mode
              : Colors.black, // Border color for light mode
          width: 2, // Border width
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100), // Ensuring the image is clipped inside the circle
        child: Image.network(
          image,
          fit: BoxFit.cover, // Adjust image to cover the circular area
        ),
      ),
    );
  }

  // Override equals and hashCode for accurate comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RecipeModel &&
              runtimeType == other.runtimeType &&
              image == other.image;

  @override
  int get hashCode => image.hashCode;
}
