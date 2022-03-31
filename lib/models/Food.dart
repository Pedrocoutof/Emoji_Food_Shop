import 'package:shop_emoji_ui/models/IFood.dart';
import 'package:shop_emoji_ui/models/Ingredient.dart';

class Food{
  late String nameSearch;
  late String nameDisplay;
  late String asset_img;
  String? description = "";
  late bool favorite;
  List<Ingredient> ingredents = [];

  Food({required String nameDisplay, required String asset_img, required bool favorite, String? description, Ingredient? ingredient}){

    this.nameDisplay = nameDisplay;
    this.asset_img = asset_img;
    this.favorite = favorite;
    nameSearch = nameDisplay.toUpperCase();

    description != null ? this.description = description : description;
  }

  favoriteChange(){
    this.favorite = !this.favorite;
    AttFavoriteFoodLists(this);
  }

  addIngredient(int count, String ingredient){
    Ingredient newIgredient = Ingredient(ingredient: ingredient, count: count);
    this.ingredents.add(newIgredient);
  }
}