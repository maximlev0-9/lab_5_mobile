part of 'cocktail_bloc.dart';

@immutable
abstract class CocktailEvent {}

class GetCocktail extends CocktailEvent {
  GetCocktail();
}

class BackFromError extends CocktailEvent {
  BackFromError();
}
