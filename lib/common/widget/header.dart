import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lighthouse_web_app/core/utils/responsive.dart';

class HeaderWidget extends StatefulWidget {
  final String title;
  const HeaderWidget({super.key, required this.title});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        if (!Responsive.isDesktop(context))
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        if (!Responsive.isDesktop(context))
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/svg/summary_chart.svg",
                  width: 23,
                  height: 23,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ],
          ),
      ],
    );
  }
}
