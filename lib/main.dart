import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/provider/color_provider.dart';
import 'package:reciepe/provider/theme_provider.dart';
import 'package:reciepe/theme.dart';

import 'screens/screens.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => ColorProvider())
    ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      themeMode: themeProvider.themeMode,
      home: const HomeScreen(), // Your main screen widget
    );
  }
}

