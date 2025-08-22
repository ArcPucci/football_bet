import 'package:flutter/material.dart';

class NavBarClipper extends CustomClipper<Path> {
  final double radius = 34;

  @override
  Path getClip(Size size) {
    final cutRectWidth = size.width * 0.41;
    final cutRectHeight = size.height;
    final smallRectHeight = size.height * 0.85;

    final outer = Path();

    outer.addRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, cutRectWidth, cutRectHeight),
        topLeft: Radius.circular(radius),
        topRight: const Radius.circular(5),
        bottomLeft: Radius.circular(radius),
      ),
    );

    outer.addRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(size.width * 0.59, 0, cutRectWidth, cutRectHeight),
        topLeft: const Radius.circular(5),
        topRight: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
    );

    outer.addRect(
      Rect.fromLTWH(
        cutRectWidth,
        size.height - smallRectHeight,
        size.width - cutRectWidth * 2,
        smallRectHeight,
      ),
    );

    final cut = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height * 0.11),
          width: size.width - cutRectWidth * 2,
          height: size.width - cutRectWidth * 2,
        ),
      );

    final result = Path.combine(PathOperation.difference, outer, cut);
    return result;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
