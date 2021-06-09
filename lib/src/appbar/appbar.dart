import 'package:flutter/material.dart';

class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0, size.height + 40);
    path.quadraticBezierTo(
        size.width / 20 - (100), size.height / 10, size.width, size.height);

    path.quadraticBezierTo(
        1 / 4 * size.width, size.height * 2, size.width, size.height * 2);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
