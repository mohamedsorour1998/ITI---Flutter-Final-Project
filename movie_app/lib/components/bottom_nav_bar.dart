// A StatelessWidget that represents the bottom navigation bar with icons.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;

  const BottomNavBar({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/movies_icon.svg'),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/tv_icon.svg'),
          label: 'TV',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/profile_icon.svg'),
          label: 'Profile',
        ),
      ],
      onTap: onTap,
    );
  }
}
