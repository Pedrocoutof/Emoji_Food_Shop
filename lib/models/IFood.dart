import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_emoji_ui/models/IIngredient.dart';
import 'package:shop_emoji_ui/models/Ingredient.dart';

import 'Food.dart';

Food burguer = Food(nameDisplay: "Burguer", assetImg: "assets/burger.png", favorite: false, description: "The best burgers offer a combination of tastes and textures – sweet, sour, salt – with a bit of crunch.");
Food taco = Food(nameDisplay: "Taco", assetImg: "assets/taco.png", favorite: false, description: "Is a traditional Mexican dish consisting of a small hand-sized corn or wheat tortilla topped with a filling.");
Food doughnut = Food(nameDisplay: "Doughnut", assetImg: "assets/doughnut.png", favorite: false, description: "A small cake of sweetened or, sometimes, unsweetened dough fried in deep fat, typically shaped like a ring or.");
Food fries = Food(nameDisplay: "Fries", assetImg: "assets/fries.png", favorite: false, description: "These are deep-fried, very thin, salted slices of potato that are usually served at room temperature.");
Food hotdog = Food(nameDisplay: "Hot-dog", assetImg: "assets/hotdog.png", favorite: false, description: "“Hot dog” means a whole, cured, cooked sausage that is skinless or stuffed in a casing.");
Food pizza = Food(nameDisplay: "Pizza", assetImg: "assets/pizza.png", favorite: false, description: "Pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of many ingredients.");
Food sandwich = Food(nameDisplay: "Sandwich", assetImg: "assets/sandwich.png", favorite: false, description: "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread.");   

List<Food> FavoriteFoodsList = [];
List<Food> foodsFound = [];


List<Food> AllFoodList =[
   burguer,
   taco,
   doughnut,
   fries,
   hotdog,
   pizza,
   sandwich,
   ];
   List<Food> RecommendedFood = [AllFoodList.first, AllFoodList.last];

initLists(){
List<Food> AllFoodList =[
   burguer,
   taco,
   doughnut,
   fries,
   hotdog,
   pizza,
   sandwich,
   ];
   List<Food> RecommendedFood = [AllFoodList.first, AllFoodList.last];
}

List<Food> SearchFoodInList(String _userSearch){
  foodsFound = [];
  
  if(_userSearch.isNotEmpty){
    _userSearch = _userSearch.toUpperCase();
  }
  
  AllFoodList.forEach((element) {
    if(element.nameSearch.contains(_userSearch)){
      foodsFound.add(element);
    }
  }
  );
  return foodsFound;
}

void AttFavoriteFoodLists(Food newFavoriteFood){
  
  
  if(!FavoriteFoodsList.contains(newFavoriteFood)){
    FavoriteFoodsList.add(newFavoriteFood);
    return;
  }

else{
  for(int i = 0; i < FavoriteFoodsList.length; i++){
    if(!FavoriteFoodsList.elementAt(i).favorite){
      FavoriteFoodsList.remove(FavoriteFoodsList.elementAt(i));
    }
  }
  }

  FavoriteFoodsList.forEach((element) {print(element.nameDisplay);});
}
