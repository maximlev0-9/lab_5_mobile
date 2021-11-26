import 'dart:convert';

// main() {
//   var cocktailJson = json.decode(
//       '{"drinks":[{"idDrink":"17226","strDrink":"Adam & Eve","strDrinkAlternate":null,"strTags":null,"strVideo":null,"strCategory":"Cocktail","strIBA":null,"strAlcoholic":"Alcoholic","strGlass":"Cocktail glass","strInstructions":"Shake together all the ingredients and strain into a cold glass.","strInstructionsES":null,"strInstructionsDE":"Alle Zutaten vermengen und in ein kaltes Glas abseihen.","strInstructionsFR":null,"strInstructionsIT":"Shakerare insieme tutti gli ingredienti e filtrare in un bicchiere freddo.","strInstructionsZH-HANS":null,"strInstructionsZH-HANT":null,"strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/vfeumw1504819077.jpg","strIngredient1":"Gin","strIngredient2":"Cognac","strIngredient3":"Creme de Cassis","strIngredient4":"Fresh Lemon Juice","strIngredient5":null,"strIngredient6":null,"strIngredient7":null,"strIngredient8":null,"strIngredient9":null,"strIngredient10":null,"strIngredient11":null,"strIngredient12":null,"strIngredient13":null,"strIngredient14":null,"strIngredient15":null,"strMeasure1":"1 shot ","strMeasure2":"1 shot ","strMeasure3":"1 shot ","strMeasure4":"1\/8 shot ","strMeasure5":null,"strMeasure6":null,"strMeasure7":null,"strMeasure8":null,"strMeasure9":null,"strMeasure10":null,"strMeasure11":null,"strMeasure12":null,"strMeasure13":null,"strMeasure14":null,"strMeasure15":null,"strImageSource":null,"strImageAttribution":null,"strCreativeCommonsConfirmed":"No","dateModified":"2017-09-07 22:17:58"}]}')
//   ["drinks"][0];
//   var cocktail = CocktailReceipt.fromJson(cocktailJson);
//   print(cocktail.name);
// }

CocktailReceipt cocktailReceiptFromJson(String str) {
  print(str);
  print(json.decode(str));
  print(json.decode(str)["drinks"][0]);
  print("sth");
  print(CocktailReceipt.fromJson(json.decode(str)["drinks"][0]));
  print("sth2");
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
    print(result);
    return result;
  }
}
