
import 'package:flutter/material.dart';

/// Custom clipper for the top curve
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 30); // move down from top-left
    path.quadraticBezierTo(
      size.width / 2,
      -30, // control point (curve height)
      size.width,
      30, // end point (top-right)
    );
    path.lineTo(size.width, size.height); // bottom-right
    path.lineTo(0, size.height); // bottom-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
