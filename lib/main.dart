import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/provider/theme_provider.dart';

import 'screens/screens.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(),),
    ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.themeData,
        home: HomeScreen(),
      );
    });
  }
}

