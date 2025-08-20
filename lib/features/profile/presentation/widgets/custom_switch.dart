import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;

  const CustomCupertinoSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = CupertinoColors.activeGreen,
    this.inactiveColor = CupertinoColors.systemGrey,
    this.width = 50,
    this.height = 30,
  });

  @override
  State<CustomCupertinoSwitch> createState() => _CustomCupertinoSwitchState();
}

class _CustomCupertinoSwitchState extends State<CustomCupertinoSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.value ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(covariant CustomCupertinoSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final knobSize = widget.height - 6;

    return GestureDetector(
      onTap: _toggle,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.height / 2),
              color: Color.lerp(
                widget.inactiveColor,
                widget.activeColor,
                _controller.value,
              ),
            ),
            child: Align(
              alignment: Alignment.lerp(
                Alignment.centerLeft,
                Alignment.centerRight,
                _controller.value,
              )!,
              child: Container(
                width: knobSize,
                height: knobSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
