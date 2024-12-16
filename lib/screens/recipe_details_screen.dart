import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/provider/favourite_provider.dart';
import '../models/recipe_model.dart';


class RecipeDetailsScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              recipe.image,
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: Consumer<FavouriteProvider>(
              builder: (context, provider, child) {
                final isFavourite = provider.isFavourite(recipe);
                return Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black, // Border color for light mode
                      width: 2, // Border width
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        isFavourite
                            ? provider.removeFavourite(recipe)
                            : provider.addFavourite(recipe);
                      },
                      icon: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border_rounded,
                        color: isFavourite ? Colors.red : Colors.black,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ),
                );
              },
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.foodName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "This Healthy Taco Salad is the universal delight of taco night.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      // Nutrition Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNutritionItem("65g", "Carbs"),
                          _buildNutritionItem("27g", "Proteins"),
                          _buildNutritionItem("120", "Kcal"),
                          _buildNutritionItem("91g", "Fats"),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Tabs
                      Row(
                        children: [
                          _buildTabButton("Ingredients", isSelected: true),
                          _buildTabButton("Instructions"),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Ingredients Section
                      const Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildIngredientItem("Tortilla Chips", "2"),
                      _buildIngredientItem("Avocado", "1"),
                      _buildIngredientItem("Red Cabbage", "9"),
                      _buildIngredientItem("Peanuts", "1"),
                      _buildIngredientItem("Red Onions", "1"),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 12),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Add To Cart",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildTabButton(String title, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientItem(String name, String quantity) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal.shade50,
        child: Text(
          name[0],
          style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {},
          ),
          Text(quantity),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

