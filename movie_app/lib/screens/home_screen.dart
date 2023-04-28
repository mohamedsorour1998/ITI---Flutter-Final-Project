import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/components/bottom_nav_bar.dart';
import 'package:movie_app/components/movie_slider.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/widgets/arrow_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> _popularMovies;
  late Future<List<Movie>> _topRatedMovies;

  @override
  void initState() {
    super.initState();
    _popularMovies = MovieApi().fetchMovies('movie/popular');
    _topRatedMovies = MovieApi().fetchMovies('movie/top_rated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOVIES',
          style: TextStyle(fontFamily: 'SFProDisplay-Bold', fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/search_icon.svg'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Now',
                style: TextStyle(
                  fontFamily: 'SFProDisplay-Bold',
                  fontSize: 24,
                ),
              ),
            ),
            FutureBuilder(
              future: _popularMovies,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return MovieSlider(
                    movies: snapshot.data!,
                    onMovieTap: (movie) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                    movie: movie,
                                  )));
                    },
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(
                  fontFamily: 'SFProDisplay-Bold',
                  fontSize: 24,
                ),
              ),
            ),
            FutureBuilder(
              future: _topRatedMovies,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return MovieSlider(
                    movies: snapshot.data!,
                    onMovieTap: (movie) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                    movie: movie,
                                  )));
                    },
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Popular',
                style: TextStyle(
                  fontFamily: 'SFProDisplay-Bold',
                  fontSize: 24,
                ),
              ),
            ),
            FutureBuilder(
              future: _topRatedMovies,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return MovieSlider(
                    movies: snapshot.data!,
                    // title: 'Popular',
                    onMovieTap: (movie) {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                    movie: movie,
                                  )));
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          if (index == 0) {
//do nothing
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/tv');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
