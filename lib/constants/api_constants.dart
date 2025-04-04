import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = "https://api.themoviedb.org/3";
  static String apiKey = dotenv.get("MOVIE_API_KEY");
  static String barearToken = dotenv.get("MOVIE_BAREARTOKEN");
  static Map<String, String> get headers => {
    'Authorization': 'Bearer $barearToken',
    'accept': 'application/json',
  };
}
