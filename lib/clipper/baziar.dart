import 'package:flutter/material.dart';

class Baziar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = Path();
    path.moveTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, height * 0.18);

    path.quadraticBezierTo(
        width * 0.75, height * 0.18, width * 0.59, height * 0.06);
    path.quadraticBezierTo(
        width * 0.5, height * 0.0, width * 0.35, height * 0.08);
    path.quadraticBezierTo(
        width * 0.2, height * 0.18, width * 0.0, height * 0.18);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
