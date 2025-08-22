import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/widgets/widgets.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/png/banner.png',
          width: 390.w,
          height: 286.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 15.r,
          child: SizedBox(
            width: 390.w,
            height: 207.r,
            child: CarouselSlider(
              items: [SoccerCard(), FootballCard(), BasketballCard()],
              options: CarouselOptions(
                height: 207.r,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    setState(() => _selected = index),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.r,
          child: CustomPageIndicator(selected: _selected),
        ),
      ],
    );
  }
}
