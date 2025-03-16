import 'package:flutter/material.dart';

class IsLive extends StatelessWidget {
  const IsLive({
    super.key,
    required Animation<double> animation,
  }) : _animation = animation;

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleTransition(
          scale: _animation,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.greenAccent[700],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent.withOpacity(0.6),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          "ACTIVE SESSION",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.greenAccent[700],
            shadows: [
              Shadow(
                blurRadius: 10,
                color: const Color.fromRGBO(0, 230, 118, 1),
                offset: const Offset(0, 0),
              ),
            ],
          ),
          // TextStyle(
          //   color: Colors.greenAccent[700],
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16,
          // shadows: [
          //   Shadow(
          //     blurRadius: 10,
          //     color: const Color.fromRGBO(0, 230, 118, 1),
          //     offset: const Offset(0, 0),
          //   ),
          // ],
          // ),
        )
      ],
    );
  }
}
