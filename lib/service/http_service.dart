import 'package:http/http.dart' as http;

class HttpService {
  static final baseUrl = "https://the-cocktail-db.p.rapidapi.com/random.php";
  static final options = {
    "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
    "x-rapidapi-key": "138241ceb3msh5585d3bddf44f28p104a06jsnfe5cd62e4ce5"
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
