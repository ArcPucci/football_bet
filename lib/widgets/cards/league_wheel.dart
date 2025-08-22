import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/models.dart';

class LeagueWheel extends StatefulWidget {
  const LeagueWheel({
    super.key,
    required this.leagues,
    required this.onChangedLeague,
    this.initialIndex = 0,
  });

  final int? initialIndex;
  final List<LeagueModel> leagues;
  final void Function(int index) onChangedLeague;

  @override
  State<LeagueWheel> createState() => _LeagueWheelState();
}

class _LeagueWheelState extends State<LeagueWheel> {
  late FixedExtentScrollController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex ?? 0;
    _controller = FixedExtentScrollController(initialItem: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 355.w,
      height: 135.r,
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView.useDelegate(
          controller: _controller,
          itemExtent: 135.r,
          diameterRatio: 1000,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            setState(() => _selectedIndex = index);
            widget.onChangedLeague(index);
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: widget.leagues.length,
            builder: (context, index) {
              final realIndex = index % widget.leagues.length;
              final delta = index - _selectedIndex;

              return RotatedBox(
                quarterTurns: 1,
                child: buildCard(widget.leagues[realIndex], delta),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildCard(LeagueModel league, int delta) {
    final bool isActive = delta == 0;
    final size = isActive ? 135.r : 95.r;

    Alignment alignment;
    if (isActive) {
      alignment = Alignment.center;
    } else if (delta < 0) {
      alignment = Alignment.bottomRight;
    } else {
      alignment = Alignment.bottomLeft;
    }

    return Align(
      alignment: alignment,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        width: size,
        height: size,
        margin: EdgeInsets.symmetric(horizontal: 4.r, vertical: 4.r),
        child: Opacity(
          opacity: isActive ? 1 : 0.5,
          child: Image.asset(
            league.asset,
            width: size,
            height: size,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
