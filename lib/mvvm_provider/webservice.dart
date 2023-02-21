import 'dart:convert';
import 'dart:developer';

import 'movie.dart';
import 'package:http/http.dart' as http;

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {

    final url = "https://api.github.com/search/repositories?q=$keyword&page=1&per_page=20";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {

      //log("" + response.body.toString() ?? "");
      final body = jsonDecode(response.body);

      final Iterable json = body["items"];
      return json.map((movie) => Movie.fromJson(movie)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}