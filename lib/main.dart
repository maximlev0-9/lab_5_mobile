import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/bloc/cocktail_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/cocktail_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/data/cocktail_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail App',
      color: Colors.green,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: BlocProvider(
        create: (context) => CocktailBloc(CocktailRepository()),
        child: Home(),
      ),
    );
  }
}
