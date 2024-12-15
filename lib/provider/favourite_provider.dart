import 'package:flutter/material.dart';
import 'package:reciepe/models/recipe_model.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<RecipeModel> _favourites = [];

  List<RecipeModel> get favourites => _favourites;

  void addFavourite(RecipeModel recipe) {
    _favourites.add(recipe);
    notifyListeners();
  }

  void removeFavourite(RecipeModel recipe) {
    _favourites.remove(recipe);
    notifyListeners();
  }

  bool isFavourite(RecipeModel recipe) {
    return _favourites.contains(recipe);
  }
}
