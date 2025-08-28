import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class NumberPicker extends StatefulWidget {
  const NumberPicker({
    super.key,
    required this.primaryColor,
    this.onChanged,
    this.initialValue = 0,
    this.enabled = true,
  });

  final int initialValue;
  final bool enabled;
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
    _selected = widget.initialValue;
    _controller = FixedExtentScrollController(initialItem: _selected + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91.w,
      height: 39.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.sp,
          color: widget.enabled
              ? widget.primaryColor
              : Colors.white.withValues(alpha: 0.4),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView.useDelegate(
          controller: _controller,
          itemExtent: 30.w,
          diameterRatio: 2.5,
          perspective: 0.001,
          physics: widget.enabled
              ? const FixedExtentScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          onSelectedItemChanged: (index) {
            if (index == 0) {
              _controller.animateToItem(
                1,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
              return;
            }
            final value = index - 1;
            widget.onChanged?.call(value);
            setState(() => _selected = value);
          },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 202,
              builder: (context, index) {
                final text = index == 0 ? '-' : "${index - 1}";
                final value = index == 0 ? 0 : index - 1;

                return RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: AppTextStyles.cns16.copyWith(
                          color: index == 0
                              ? Colors.white.withValues(alpha: 0.4)
                              : widget.enabled
                              ? value == _selected
                              ? widget.primaryColor
                              : Colors.white.withValues(alpha: 0.4)
                              : Colors.white.withValues(alpha: 0.4),
                        ),
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
