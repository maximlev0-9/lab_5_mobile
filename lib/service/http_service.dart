import 'package:http/http.dart' as http;

String apikey = "Please enter Api Key here";

class HttpService {
  static final baseUrl = "https://the-cocktail-db.p.rapidapi.com/random.php";
  static final options = {
    "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
    "x-rapidapi-key": apikey
  };

  static Future<http.Response> getRequest() async {
    http.Response response;

    final url = Uri.parse(baseUrl);
    try {
      response = await http.get(url, headers: options);
    } on Exception catch (e) {
      throw e;
    }
    return response;
  }
}
