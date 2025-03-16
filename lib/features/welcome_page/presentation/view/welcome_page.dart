import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkNavy,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/en-logo.svg',
                    width: isMobile ? 250 : 350,
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    'assets/svg/lighthouse_ch.svg',
                    width: isMobile ? 350 : 450,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Coming Soon...',
                    style: TextStyle(
                      fontSize: isMobile ? 36 : 48,
                      fontWeight: FontWeight.bold,
                      color: lightGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}