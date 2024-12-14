import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/main.dart';
import 'package:reciepe/provider/theme_provider.dart';
import 'package:reciepe/widgets/bottom_nav_bar_widget.dart';
import 'package:reciepe/widgets/category_widget.dart';
import 'package:reciepe/widgets/featured_card/featured_card_widget.dart';
import 'package:reciepe/widgets/recipe_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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
                          icon: Icon(themeProvider.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
                          onPressed: () {
                            themeProvider.toggleTheme();
                          },
                        ),
                        // Dark Mode Button
                      ],
                    ),

                  ],
                ),
                //   Featured Card
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text('Featured',
                        style: Theme.of(context).textTheme.titleLarge),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                      children:
                        List.generate(3, (index) => FeaturedCardWidget()),
                    )),
                  ],
                ),
                //   Category
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Category', style: Theme.of(context).textTheme.titleLarge,),
                        Text('See All', style: TextStyle(color: Theme.of(context).primaryColor),),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryWidget(text: 'Breakfast', keyValue: 'breakfast'),
                          CategoryWidget(text: 'Lunch', keyValue: 'lunch'),
                          CategoryWidget(text: 'Dinner', keyValue: 'dinner'),
                          CategoryWidget(text: 'Snack', keyValue: 'snack'),
                        ],
                      ),
                    )
                  ],
                ),
                //   popular recipes
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Popular Recipes', style: Theme.of(context).textTheme.titleLarge,),
                        Text('See All', style: TextStyle(color: Theme.of(context).primaryColor),),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          RecipeWidget(image: 'assets/images/salad.png', foodName: 'Taco Salad with Fresh vegetables', cal: '120 kcal', time: '20 min'),
                          RecipeWidget(image: 'assets/images/pancake.png', foodName: 'Japanese-style Pancake', cal: '64 kcal', time: '15 min'),
                        ],
                      ),
                    ),
                  ],
                ),
                // bottom nav bar
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
