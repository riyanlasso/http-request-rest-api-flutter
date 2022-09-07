import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:httprequestrestapiflutter/models/movie.dart';

class HttpService {
  final String apiKey = 'c1ba286a2dea5043f55e0a5bfd28ce27';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/550?api_key=';
  Future getPopularMovies() async {
    final String uri = baseUrl + apiKey;
    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
