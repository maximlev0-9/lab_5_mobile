import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/cocktail_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/cocktail_receipt.dart';

import 'chosen_cocktails_page.dart';
import 'cocktail_details_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CocktailReceipt> likedCocktails = [];
  String someText = "lol";

  getMainPage(BuildContext context) {
    final bloc = context.watch<CocktailBloc>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Random Cocktail Receipts App",
              style: TextStyle(
                color: Colors.green,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                Container(
                  // width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      bloc.add(GetCocktail());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.all(16)),
                    child: Text("Get random cocktail receipt"),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  // width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChosenCocktails(likedCocktails, likeCocktail),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.all(16)),
                    child: Text("View All Liked Receipts"),
                  ),
                ),
              ],
            ),
            Text(
              "Tap on the button to find receipt for a random cocktail",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message, bloc) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: () {
            bloc.add(BackFromError());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 100),
            child: Text(
              message,
              style: TextStyle(color: Colors.black),
            ),
          )),
    );
  }

  likeCocktail(CocktailReceipt cocktail) {
    setState(() {
      if (likedCocktails.contains(cocktail)) {
        likedCocktails.remove(cocktail);
      } else {
        likedCocktails.add(cocktail);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CocktailBloc>();

    return BlocListener(
        listener: (context, state) {
          if (state is CocktailLoaded && state.cocktail != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CocktailDetails(state.cocktail, likeCocktail, true);
              }),
            );
          }
        },
        cubit: bloc,
        child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              child: bloc.state is CocktailLoading
                  ? getLoadingWidget()
                  : bloc.state is CocktailError
                      ? getErrorWidget("Some Error", bloc)
                      : bloc.state is CocktailInitial
                          ? getMainPage(context)
                          : Container(
                              child: Text(bloc.state.toString()),
                            )),
        ));
  }
}
