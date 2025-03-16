// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:lighthouse_web_app/core/resources/colors.dart';

// ignore: must_be_immutable
class MainButton extends StatefulWidget {
  final String title;
  void Function() onTap;
   final Widget icon;
  MainButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: 69,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: yellow,
          ),
          child: FittedBox(
            child: Row(
              children: [
                widget.icon,
                const SizedBox(width: 15),
                Text(
                  widget.title.tr(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
