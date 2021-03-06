import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/cocktail_receipt.dart';
import 'package:flutter_cubit_bloc_tutorial/data/cocktail_repository.dart';
import 'package:meta/meta.dart';

part 'cocktail_event.dart';
part 'cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  final CocktailRepository _cocktailRepository;

  CocktailBloc(this._cocktailRepository) : super(CocktailInitial());

  @override
  Stream<CocktailState> mapEventToState(
      CocktailEvent event,
  ) async* {
    if (event is GetCocktail) {
      try {
        yield CocktailLoading();
        final cocktail = await _cocktailRepository.getRandomCocktail();
        yield CocktailLoaded(cocktail);
        yield CocktailInitial();
      } on Exception {
        yield CocktailError("Couldn't fetch cocktail. Is the device online?");
      }
    } else if (event is BackFromError) {
      yield CocktailInitial();
    }
  }
}
