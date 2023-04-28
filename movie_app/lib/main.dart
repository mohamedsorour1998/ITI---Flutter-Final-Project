// Set up the MaterialApp with the SplashScreen as the initial route.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/screens/splash_screen.dart';
import 'package:movie_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        navigateAfterSeconds: 3,
        nextScreen: HomeScreen(),
      ),
    );
  }
}
