import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/provider/color_provider.dart';

class CategoryWidget extends StatelessWidget {
  final String text;
  final String keyValue; // Unique key for each container

  CategoryWidget({super.key, required this.text, required this.keyValue});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, colorProvider, child) {
        // Get the current color of the container
        Color containerColor = colorProvider.getColor(keyValue);

        // Determine text color based on the container color
        Color textColor = containerColor == Color(0xFF70B9BE) ? Colors.white : Colors.black;

        return GestureDetector(
          onTap: () {
            colorProvider.changeColor(keyValue); // Change color for this key
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: containerColor, // Set the color of the container
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              text,
              style: TextStyle(color: textColor), // Set the text color
            ),
          ),
        );
      },
    );
  }
}
