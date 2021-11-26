part of 'cocktail_bloc.dart';

@immutable
abstract class CocktailState {
  const CocktailState();
}

class CocktailInitial extends CocktailState {
  const CocktailInitial();
}

class CocktailLoading extends CocktailState {
  const CocktailLoading();
}

class CocktailLoaded extends CocktailState {
  final CocktailReceipt cocktail;
  const CocktailLoaded(this.cocktail);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CocktailLoaded && o.cocktail == cocktail;
  }

  @override
  int get hashCode => cocktail.hashCode;
}

class CocktailError extends CocktailState {
  final String message;
  const CocktailError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CocktailError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
