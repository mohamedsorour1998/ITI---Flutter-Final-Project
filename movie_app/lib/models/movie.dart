import 'package:movie_app/models/crew_member.dart';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final DateTime releaseDate;
  // final String crewMemberName;
  // final String crewMemberProfilePath;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
 

  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: DateTime.parse(json['release_date']),
      // crewMember: CrewMember.fromJson(
      //     json['credits']['crew'][0] as Map<String, dynamic>),
    );
  }

  bool isNowPlaying() {
    final now = DateTime.now();
    return releaseDate.isAfter(now) || releaseDate.isAtSameMomentAs(now);
  }

  bool isPopular() => voteAverage >= 7.0;
}
