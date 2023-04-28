// A StatelessWidget that represents an arrow button for navigating sliders.
import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ArrowButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
