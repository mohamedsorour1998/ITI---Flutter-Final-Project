import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/crew_member.dart';
import '../models/movie.dart';
import '../utils/constants.dart';
// this is how the crew members data looks like when we fetch it from the API:
// https://api.themoviedb.org/3/movie/550/credits?api_key=fe32a5db54bad1ad4834c540a6400185&language=en-US
// "id":550,"cast":[{"adult":false,"gender":2,"id":819,"known_for_department":"Acting","name":"Edward Norton","original_name":"Edward Norton","popularity":30.559,"profile_path":"/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg","cast_id":4,"character":"The Narrator","credit_id":"52fe4250c3a36847f80149f3","order":0},{"adult":false,"gender":2,"

class MovieApi {
  final String apiKey = Constants.apiKey;

  Future<List<Movie>> fetchMovies(String endpoint) async {
    final response = await http.get(
      Uri.parse(
          '${Constants.baseApiUrl}/$endpoint?api_key=$apiKey&language=en-US&page=1'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];

      return results.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<CrewMember>> fetchMovieCrew(int movieId) async {
    final response = await http.get(
      Uri.parse(
          '${Constants.baseApiUrl}/movie/$movieId/credits?api_key=$apiKey&language=en-US'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['cast'];
      return results.map((crewData) => CrewMember.fromJson(crewData)).toList();
    } else {
      throw Exception('Failed to load movie crew');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse(
          '${Constants.baseApiUrl}/search/movie?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];

      return results.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
