import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/provider/favourite_provider.dart';
import 'package:reciepe/widgets/bottom_nav_bar_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavouriteProvider>(builder: (context, provider, child) {
        final favourites = provider.favourites;
        return provider.favourites.isEmpty ? Center(child: Text('NO FAVOURITES ADDED!'),) :
            ListView.builder(
                itemCount: favourites.length,
                itemBuilder: (context, index) {
              final recipe = provider.favourites[index];
              return ListTile(
                leading: Image.asset(recipe.image),
                title: Text(recipe.foodName),
                subtitle: Row(
                  children: [
                    Icon(Icons.local_fire_department_outlined, size: 16,),
                Text(' ${recipe.cal}'),
                SizedBox(width: 10),
                Icon(Icons.alarm, size: 16),
                Text(' ${recipe.time}'),
                  ],
                ),
                trailing: IconButton(onPressed: () {provider.removeFavourite(recipe);}, icon: Icon(Icons.delete, color: Colors.red,)),
              );
            });
      }),
      bottomNavigationBar: BottomNavBarWidget()
    );
  }
}
