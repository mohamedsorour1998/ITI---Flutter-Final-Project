// A StatelessWidget that displays a movie slider.
import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/arrow_button.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final Key? key;
  final void Function(Movie movie) onMovieTap;

  const MovieSlider({required this.movies, this.key, required this.onMovieTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () => onMovieTap(movies[index]),
                  child: MovieCard(movie: movies[index]),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
