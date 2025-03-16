// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:rive/rive.dart';

import 'package:lighthouse_web_app/features/navigation_screen/presentation/widget/rive_asset.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
    required this.menu,
    required this.press,
    required this.riveOnInit,
    required this.isActive,
  }) : super(key: key);

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            Container(
              height: 56,
              alignment: Alignment.center,
              child: ListTile(
                onTap: press,
                leading: SizedBox(
                  width: 34,
                  height: 34,
                  child: menu.index == 2
                      ? Icon(Icons.qr_code,color: Colors.white,)
                      : RiveAnimation.asset(
                          menu.src,
                          artboard: menu.artboard,
                          onInit: riveOnInit,
                        ),
                ),
                title: Text(
                  menu.title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
