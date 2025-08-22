import 'package:flutter/material.dart';

class ExpandableBox extends StatefulWidget {
  final Widget child; // тело (что раскрывается)
  final Widget Function(
      BuildContext context,
      VoidCallback toggle,
      bool expanded,
      ) triggerBuilder;

  const ExpandableBox({
    super.key,
    required this.child,
    required this.triggerBuilder,
  });

  @override
  State<ExpandableBox> createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    _expanded ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.triggerBuilder(context, _toggle, _expanded),
        ClipRect(
          child: SizeTransition(
            sizeFactor: _animation,
            axisAlignment: -1.0,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
