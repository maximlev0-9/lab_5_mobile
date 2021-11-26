import 'dart:convert';


CocktailReceipt cocktailReceiptFromJson(String str) {
  return CocktailReceipt.fromJson(json.decode(str)["drinks"][0]);
}

class CocktailReceipt {
  String id;
  String name;
  String category;
  String glassType;
  String instructions;
  String drinkImage;
  Map<String, String> ingredientAmountMap;

  CocktailReceipt(
      {this.id,
      this.name,
      this.category,
      this.glassType,
      this.instructions,
      this.drinkImage,
      this.ingredientAmountMap});

  factory CocktailReceipt.fromJson(Map<String, dynamic> json) =>
      CocktailReceipt(
        id: json["idDrink"],
        name: json["strDrink"],
        category: json["strCategory"],
        glassType: json["strGlass"],
        instructions: json["strInstructions"],
        drinkImage: json["strDrinkThumb"],
        ingredientAmountMap: fromJsonToIngredientMap(json),
      );

  static Map<String, String> fromJsonToIngredientMap(json) {
    String ingrPrefix = "strIngredient";
    String measurePrefix = "strMeasure";
    int i = 1;
    Map<String, String> result = {};
    while (true) {
      if (json[ingrPrefix + i.toString()] != null) {
        result[json[ingrPrefix + i.toString()]] =
            json[measurePrefix + i.toString()] != null
                ? json[measurePrefix + i.toString()]
                : "";
      } else {
        break;
      }
      i++;
    }
    return result;
  }
}
