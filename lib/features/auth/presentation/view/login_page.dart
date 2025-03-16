import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lighthouse_web_app/core/utils/responsive.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:lighthouse_web_app/common/widget/text_field_widget.dart';
import 'package:lighthouse_web_app/common/widget/main_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    bool isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      backgroundColor: darkNavy,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 250 : isTablet ? 100 : 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isDesktop) ...[
                  SvgPicture.asset(
                    'assets/svg/en-logo.svg',
                    height: isMobile ? 100 : 80,
                  ),
                  const SizedBox(height: 75),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isDesktop) ...[
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/svg/lighthouse_ch.svg',
                          height: 600,
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(30),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (isDesktop) ...[
                              SvgPicture.asset(
                                'assets/svg/dark-en-logo.svg',
                                height: 70,
                              ),
                              const SizedBox(height: 20),
                            ],
                            MyTextFieldDialog(
                              controller: phoneController,
                              labelText: "Phone Number",
                              isPassword: false,
                            ),
                            MyTextFieldDialog(
                              controller: passwordController,
                              labelText: "Password",
                              isPassword: true,
                            ),
                            const SizedBox(height: 20),
                            MainButton(
                              title: "Login",
                              onTap: () {
                                context.go("/change-password");
                              },
                              icon: const Icon(Icons.login, color: Colors.white),
                            ),
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {
                                // Handle forgot password logic
                              },
                              child: Text(
                                "Back",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: orange),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}