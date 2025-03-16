import 'package:flutter/material.dart';
import 'package:lighthouse_web_app/features/home/presentation/widget/is_live.dart';
import 'package:lighthouse_web_app/features/home/presentation/widget/is_off.dart';

class LiveIndicator extends StatefulWidget {
  final bool isLive;
  const LiveIndicator({Key? key, required this.isLive}) : super(key: key);

  @override
  _LiveIndicatorState createState() => _LiveIndicatorState();
}

class _LiveIndicatorState extends State<LiveIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (widget.isLive) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      )..repeat(reverse: true);

      _animation = Tween<double>(begin: 0.8, end: 1.4).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  @override
  void dispose() {
    if (widget.isLive) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLive) {
      return IsLive(animation: _animation);
    } else {
      return IsOff();
    }
  }
}
