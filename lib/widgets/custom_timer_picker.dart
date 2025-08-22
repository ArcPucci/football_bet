import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayHourMinutePicker extends StatefulWidget {
  final int days;
  final int hours;
  final int minutes;
  final void Function(int days, int hours, int minutes) onSelected;

  const DayHourMinutePicker({
    super.key,
    required this.onSelected,
    required this.days,
    required this.hours,
    required this.minutes,
  });

  @override
  State<DayHourMinutePicker> createState() => _DayHourMinutePickerState();
}

class _DayHourMinutePickerState extends State<DayHourMinutePicker> {
  int _selectedDay = 0;
  int _selectedHour = 0;
  int _selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.days;
    _selectedHour = widget.hours;
    _selectedMinute = widget.minutes;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: _selectedDay,
              ),
              itemExtent: 40,
              looping: true,
              offAxisFraction: -0.3,
              onSelectedItemChanged: (index) {
                setState(() => _selectedDay = index);
                widget.onSelected(_selectedDay, _selectedHour, _selectedMinute);
              },
              children: List.generate(31, (i) => Center(child: Text("$i d"))),
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: _selectedHour,
              ),
              itemExtent: 40,
              looping: true,
              onSelectedItemChanged: (index) {
                setState(() => _selectedHour = index);
                widget.onSelected(_selectedDay, _selectedHour, _selectedMinute);
              },
              children: List.generate(24, (i) => Center(child: Text("$i h"))),
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: _selectedMinute,
              ),
              itemExtent: 40,
              looping: true,
              offAxisFraction: 0.3,
              onSelectedItemChanged: (index) {
                setState(() => _selectedMinute = index);
                widget.onSelected(_selectedDay, _selectedHour, _selectedMinute);
              },
              children: List.generate(60, (i) => Center(child: Text("$i m"))),
            ),
          ),
        ],
      ),
    );
  }
}
