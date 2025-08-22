import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({super.key, required this.primaryColor, this.onChanged});

  final Color primaryColor;
  final void Function(int)? onChanged;

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late FixedExtentScrollController _controller;
  int _selected = 0;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: _selected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91.w,
      height: 39.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1.sp, color: widget.primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView.useDelegate(
          controller: _controller,
          itemExtent: 30.w,
          diameterRatio: 2.5,
          perspective: 0.001,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            widget.onChanged?.call(index);
            setState(() => _selected = index);
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 21,
            builder: (context, index) {
              return RotatedBox(
                quarterTurns: 1,
                child: Center(
                  child: Text(
                    "$index",
                    style: AppTextStyles.cns16.copyWith(
                      color: index == _selected
                          ? widget.primaryColor
                          : Colors.white.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
