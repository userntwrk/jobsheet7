import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jobsheet7/models/movie.dart';

class HttpService {
  final String apiKey = 'a710be9b018ffce3a77fcbd04bbe8bd0';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/550?api_key=';

  Future<List?> getPopularMovies() async {
    final String url = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("Sukses");
      }
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      if (kDebugMode) {
        print("Fail");
      }
      return null;
    }
  }
}
