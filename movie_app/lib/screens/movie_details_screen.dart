// A StatefulWidget that displays detailed information about a selected movie.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/movie.dart';
import '../models/crew_member.dart';
import '../components/crew_slider.dart';
import '../widgets/arrow_button.dart';
import '../utils/constants.dart';
import '../api/movie_api.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  MovieDetailsScreen(
      {required this.movie}); // Make sure you have this constructor

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<List<CrewMember>> _crewFuture;
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.movie?.id ?? 0;
  }

  @override
  Future<List<CrewMember>> _fetchMovieCrew(int movieId) async {
    return MovieApi().fetchMovieCrew(movieId);
  }

  @override
  Widget build(BuildContext context) {
    // print('Debug: widget.movie.voteAverage: ${widget.movie.voteAverage}');
    // print('Debug: widget.movie.title: ${widget.movie.title}');
    // print('Debug: widget.movie.overview: ${widget.movie.overview}');
    // print('Debug: widget.movie.posterPath: ${widget.movie.posterPath}');
    // print('Debug: widget.movie.releaseDate: ${widget.movie.releaseDate}');
    // print('Debug: widget.movie.id: ${widget.movie.id}');
    // print('Debug: widget.CrewMember.id: ${widget.CrewMember.id}');
    // print('Debug: widget.CrewMember.name: ${widget.CrewMember.name}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/back_icon.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/share_icon.svg'),
            onPressed: () {
              // Implement share functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<CrewMember>>(
          future: _fetchMovieCrew(widget.movie.id),
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            List<CrewMember> crew = snapshot.data ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.movie.posterPath ?? ""}',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FloatingActionButton(
                        onPressed: () {
                          // Implement play functionality here
                        },
                        child: Icon(Icons.play_arrow),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title ?? "",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(widget.movie.overview ?? ""),
                      SizedBox(height: 8),
                      Text(
                        'User Rating',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      RatingBarIndicator(
                        rating: (widget.movie.voteAverage ?? 0) / 2,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 24.0,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Release Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(widget.movie.releaseDate?.toString() ?? ""),
                      SizedBox(height: 16),
                      Text(
                        'Full Cast & Crew',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CrewSlider(
                        crewMembers: crew,
                        title: widget.movie.title,
                      ),
                    ],
                  ),
                ),
              ],
            );

            // By default, show a loading spinner.
          },
        ),
      ),
      bottomNavigationBar: Padding(
        // print widget.movie.voteAverage as test
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/like_icon.svg'),
                  onPressed: () {
                    // Implement like functionality here
                  },
                ),
                Text('123'), // Replace with the
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/star_icon.svg'),
                  onPressed: () {
                    // Implement star functionality here
                  },
                ),
                Text('456'), // Replace with the actual number of stars
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/comment_icon.svg'),
                  onPressed: () {
                    // Implement comment functionality here
                  },
                ),
                Text('789'), // Replace with the actual number of comments
              ],
            ),
          ],
        ),
      ),
    );
  }
}
