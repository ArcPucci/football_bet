import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/welcome_bg.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) => setState(() => _index = value),
              children: [_buildPage1(), _buildPage2(), _buildPage3()],
            ),
          ),
          Positioned(
            bottom: 18.h,
            left: 20.w,
            right: 20.w,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithText(
                    text: _index == 2 ? "BACK" : "NEXT",
                    onTap: next,
                  ),
                  CustomPageIndicator(selected: _index),
                  ButtonWithText(
                    text: _index == 2 ? "START" : "SKIP",
                    buttonColor: AppTheme.black,
                    onTap: skip,
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 0, child: CustomAppBar(text: '${_index + 1} of 3')),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/page1.png', fit: BoxFit.cover),
        ),
        Positioned(
          left: -135.r,
          bottom: -7.r,
          child: Image.asset(
            'assets/png/football_player.png',
            width: 435.r,
            height: 531.r,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget _buildPage2() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/page2.png', fit: BoxFit.cover),
        ),
        Positioned(
          left: -76.r,
          bottom: -46.r,
          child: Image.asset(
            'assets/png/soccer_player.png',
            width: 403.r,
            height: 572.r,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget _buildPage3() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/png/page3.png', fit: BoxFit.cover),
        ),
        Positioned(
          left: -212.r,
          bottom: -40.r,
          child: Image.asset(
            'assets/png/basketball_player.png',
            width: 653.r,
            height: 637.r,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  void skip() {
    if(_index == 2) {
      Provider.of<ConfigPreferences>(context, listen: false).setFirstInit();
      context.go('/');
      return;
    }

    controller.animateToPage(
      2,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void next() {
    if (_index == 2) {
      controller.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
