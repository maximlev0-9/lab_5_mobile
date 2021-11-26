import 'dart:io';

import 'package:flutter_cubit_bloc_tutorial/data/model/cocktail_receipt.dart';
import 'package:flutter_cubit_bloc_tutorial/service/http_service.dart';

class CocktailRepository{
  Future<CocktailReceipt> getRandomCocktail() async {
    try {
      final response = await HttpService.getRequest();
      print(response.body);
      print(response.statusCode);
      if(response.statusCode == 200){
        final result = cocktailReceiptFromJson(response.body);
        return result;
      } else {
        throw Exception("Failed to retrieve data.");
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

