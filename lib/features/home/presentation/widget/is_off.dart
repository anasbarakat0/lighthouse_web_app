import 'package:flutter/material.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';

class IsOff extends StatefulWidget {
  const IsOff({
    super.key,
  });

  @override
  State<IsOff> createState() => _IsOffState();
}

class _IsOffState extends State<IsOff> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "No Active Session",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: grey,
              ),
        )
      ],
    );
  }
}
