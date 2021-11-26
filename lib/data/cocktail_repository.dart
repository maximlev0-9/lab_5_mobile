import 'dart:io';

import 'package:flutter_cubit_bloc_tutorial/data/model/cocktail_receipt.dart';
import 'package:flutter_cubit_bloc_tutorial/service/http_service.dart';

class CocktailRepository{
  Future<CocktailReceipt> getRandomCocktail() async {
    try {
      final response = await HttpService.getRequest();
      print("in repo after response");
      print(response.body);
      if(response.statusCode == 200){
        print("before converting ");
        final result = cocktailReceiptFromJson(response.body);
        print("in repo before returning response");
        return result;
      }else{
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}

