class Ingredient{
  late int count = 1;
  late String? ingredient;

  Ingredient({required String ingredient, int? count} ){
      this.count = count!;
      this.ingredient = ingredient;
  }
  IngredientsList({required String ingredient, int? count} ){
      this.count = count!;
      this.ingredient = ingredient;
  }
}