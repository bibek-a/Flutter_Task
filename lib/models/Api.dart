import 'dart:convert';

// import 'package:bnb_with_bloc/models/News.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;

class API {
  static Future<List<dynamic>> getMarkets() async {
    try {
      String BaseUrl =
          dotenv.get("API_Host", fallback: "Unable to access host");
      String API_KEY =
          dotenv.get("API_Key", fallback: "Unable to access api key");
      String Path = BaseUrl +
          "/v2/everything?q=apple&from=2023-11-17&to=2023-11-17&sortBy=popularity&apiKey=" +
          API_KEY;
      Uri url = Uri.parse(Path);
      var response = await http.get(url);
      final decodedResponse = jsonDecode(response.body);
      var newsResponse = decodedResponse["articles"];
      print(newsResponse);
      List<dynamic> news = newsResponse as List<dynamic>;
      return news;
    } catch (ex) {
      return [];
    }
  }
}
