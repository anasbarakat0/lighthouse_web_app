import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lighthouse Coming Soon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02243F),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Define your custom colors
  static const Color lightGrey = Color(0xFFF4F6FF);
  static const Color grey = Color(0xFFc2c5cc);
  static const Color orange = Color(0xFFEB8317);
  static const Color yellow = Color(0xFFF3C623);
  static const Color navy = Color(0xFF10375C);
  static const Color darkNavy = Color(0xFF02243F);

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
