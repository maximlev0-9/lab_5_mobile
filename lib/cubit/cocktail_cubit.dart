// import 'package:bloc/bloc.dart';
// import 'package:flutter_cubit_bloc_tutorial/data/cocktail_repository.dart';
// import 'package:flutter_cubit_bloc_tutorial/data/model/cocktail_receipt.dart';
// import 'package:meta/meta.dart';
//
// part 'cocktail_state.dart';
//
// class CocktailCubit extends Cubit<CocktailState> {
//   final CocktailRepository _cocktailRepository;
//
//   CocktailCubit(this._cocktailRepository) : super(CocktailInitial());
//
//   Future<void> getRandomCocktail() async {
//     try {
//       emit(CocktailLoading());
//       final cocktail = await _cocktailRepository.getRandomCocktail();
//       emit(CocktailLoaded(cocktail));
//     }
//     on Exception {
//       emit(CocktailError("Couldn't fetch random cocktail. Is the device online?"));
//     }
//   }
// }
