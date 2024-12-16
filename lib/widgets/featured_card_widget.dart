import 'package:flutter/material.dart';

class FeaturedCardWidget extends StatelessWidget {
  const FeaturedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset('assets/images/Card.png'),
        ],
      ),
    );
  }
}
