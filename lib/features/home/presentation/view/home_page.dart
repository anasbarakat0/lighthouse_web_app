import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lighthouse_web_app/common/widget/my_button.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:lighthouse_web_app/features/home/presentation/widget/live_indicator_widget.dart';

class HomeScreen extends StatelessWidget {
  final bool hasActiveSession = true;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/dark-en-logo.svg',
                width: 250,
              ),
              Spacer(flex: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: hasActiveSession
                        ? LiveIndicator(isLive: true)
                        : LiveIndicator(isLive: false),
                  ),
                  SizedBox(height: 30),
                  if (hasActiveSession)
                  Container(
                    height: 200,
                    width: 300,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Started At:",
                          style:
                              Theme.of(context).textTheme.labelLarge,
                        ),
                        Spacer(),
                        Text(
                          "12:08:21.618",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: orange,
                                  ),
                        ),
                        Spacer(),
                        Text(
                          "Created By: Anas Barakat",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: grey,
                                  ),
                        ),
                        Text(
                          "Total Price: 220,500 S.P",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(flex: 2),
              if (hasActiveSession)
                MyButton(
                  child: Text(
                    "Check Buffet Invoice",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: lightGrey,
                        ),
                  ),
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
