import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  final double radius;
  final double cutRectWidth;
  final double cutRectHeight;

  AppBarClipper({
    required this.radius,
    required this.cutRectWidth,
    required this.cutRectHeight,
  });

  @override
  Path getClip(Size size) {
    final outer = Path();
    outer.addRect(Rect.fromLTWH(0, 0, size.width, size.height - cutRectHeight));
    outer.addRect(
      Rect.fromLTWH(
        size.width - cutRectWidth,
        size.height - cutRectHeight,
        cutRectWidth,
        cutRectHeight,
      ),
    );
    outer.addRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(
          0,
          0,
          size.width - cutRectWidth,
          size.height,
        ),
        bottomRight: Radius.circular(5),
      ),
    );

    final cut = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
            size.width - cutRectWidth,
            size.height - cutRectHeight,
            cutRectWidth,
            cutRectHeight,
          ),
          topLeft: Radius.circular(radius),
        ),
      );

    final result = Path.combine(PathOperation.difference, outer, cut);

    return result;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
