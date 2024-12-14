import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  // Map to store colors for each container
  final Map<String, Color> _colors = {};

  Color getColor(String key) {
    // Return color for the given key or default color
    return _colors[key] ?? Color(0xffF1F5F5);
  }

  void changeColor(String key) {
    // Toggle color for the given key
    _colors[key] = _colors[key] == Color(0xffF1F5F5)
        ? Color(0xFF70B9BE)
        : Color(0xffF1F5F5);
    notifyListeners();
  }
}
