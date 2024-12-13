import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/main.dart';
import 'package:reciepe/provider/theme_provider.dart';
import 'package:reciepe/widgets/featured_card/featured_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(CupertinoIcons.sun_min),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Good Morning',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shwaon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(CupertinoIcons.cart),
                      IconButton(
                        icon: const Icon(Icons.light_mode),
                        onPressed: () => context.read<ThemeProvider>().setLightTheme(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.dark_mode),
                        onPressed: () => context.read<ThemeProvider>().setDarkTheme(),
                      ),
                    ],
                  )
                ],
              ),
              //   Featured Card
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Featured',
                      style: Theme.of(context).textTheme.titleLarge),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                    children:
                      List.generate(3, (index) => FeaturedCardWidget()),
                  )),
                ],
              )
              //   Category
              //   popular recipes
            ],
          ),
        ),
      ),
    );
  }
}
