import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/models/recipe_model.dart';
import 'package:reciepe/provider/favourite_provider.dart';

import '../screens/screens.dart';

class RecipeWidget extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsScreen(recipe: recipe,)));
      },
      child: Container(
        height: 250,
        width: 200,
        padding:  const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                // Apply circular border to the image here
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Circular border radius
                    border: Border.all(
                      color: Colors.black, // Border color for light mode
                      width: 2, // Border width
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Ensuring the image is clipped inside the circle
                    child: Image.asset(
                      recipe.image,
                      fit: BoxFit.cover,
                      height: 150, // Adjust the size of the image
                      width: 150, // Adjust the size of the image
                    ),
                  ),
                ),
                // Favorite icon button
                Consumer<FavouriteProvider>(
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
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            Text(recipe.foodName,  style: TextStyle(color: Theme.of(context).colorScheme.scrim)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.local_fire_department_outlined, color: Theme.of(context).colorScheme.scrim,),
                Text(recipe.cal, style: TextStyle(color: Theme.of(context).colorScheme.scrim),),
                Icon(Icons.alarm, color: Theme.of(context).colorScheme.scrim),
                Text(recipe.time ,style: TextStyle(color: Theme.of(context).colorScheme.scrim)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
