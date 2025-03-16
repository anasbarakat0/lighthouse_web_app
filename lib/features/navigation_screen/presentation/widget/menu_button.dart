// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onTap;
  final ValueChanged<Artboard> riveOnInit;
  const MenuButton({
    Key? key,
    required this.onTap,
    required this.riveOnInit,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: 16),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 3),
                  blurRadius: 8,
                )
              ]),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
