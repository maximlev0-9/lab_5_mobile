import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/cocktail_receipt.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/cocktail_details_page.dart';

class ChosenCocktails extends StatelessWidget {
  final List<CocktailReceipt> likedCocktails;
  final Function likeCocktail;

  ChosenCocktails(this.likedCocktails, this.likeCocktail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Liked Cocktails"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: likedCocktails
            .map((cocktail) => ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CocktailDetails(cocktail, likeCocktail, false)),
                  ),
                  title: Text(cocktail.name),
                ))
            .toList(),
      ),
    );
  }
}
