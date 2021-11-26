import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/cocktail_receipt.dart';

class CocktailDetails extends StatefulWidget {
  final CocktailReceipt cocktail;

  final Function likeCocktail;
  final bool isNew;

  CocktailDetails(this.cocktail, this.likeCocktail, this.isNew);

  @override
  State<CocktailDetails> createState() => _CocktailDetailsState();
}

class _CocktailDetailsState extends State<CocktailDetails> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cocktail.name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Image(
                image: NetworkImage(widget.cocktail.drinkImage),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(
              children: widget.cocktail.ingredientAmountMap.entries
                  .map((entry) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(entry.key),
                            Text(entry.value),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Instructions", style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                widget.cocktail.instructions,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: widget.isNew
          ? FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  liked = !liked;
                });
                widget
                    .likeCocktail(widget.cocktail); // basically it flips liked
                // to !liked in state
              },
              child: Icon(
                liked ? Icons.star_outlined : Icons.star_outline,
                // color: liked ? Colors.red : Colors.black,
              ),
            )
          : null,
    );
  }
}
