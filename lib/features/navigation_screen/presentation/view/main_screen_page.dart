// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighthouse_web_app/features/contacts_us/presentation/view/contact_us_page.dart';
import 'package:lighthouse_web_app/features/qr/presentation/view/qr_page.dart';
import 'package:lighthouse_web_app/features/user_profile/presentation/view/client_profile_screen.dart';
import 'package:rive/rive.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:lighthouse_web_app/core/utils/responsive.dart';
import 'package:lighthouse_web_app/core/utils/rive_utils.dart';
import 'package:lighthouse_web_app/core/utils/task_notifier.dart';
import 'package:lighthouse_web_app/features/navigation_screen/presentation/widget/menu_button.dart';
import 'package:lighthouse_web_app/features/navigation_screen/presentation/widget/side_menu.dart';
import 'package:lighthouse_web_app/features/home/presentation/view/home_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    ClientProfileScreen(
      client: Client(
        name: "أنس بركات",
        uuid: "asj135asd4asd4asd2as2d4asd3",
        email: "anasbarakat0@gmail.com",
        phoneNumber: "0938406717",
        study: "هندسة معلوماتية",
        gender: "MALE",
        birthDate: "2001/06/15",
        addingDateTime: '2025/2/15',
      ),
    ),
    QRCodeScreen(data: "asj135asd4asd4asd2as2d4asd3"),
    HistorySessionsScreen(),
    UltimateContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    indexNotifier.addListener(() {
      setState(() {
        _selectedIndex = indexNotifier.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      return Scaffold(
        backgroundColor: navy,
        body: Row(
          children: [
            Container(
              width: 288,
              height: MediaQuery.of(context).size.height,
              child: SideMenu(
                context: context,
              ),
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: navy,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            height: MediaQuery.of(context).size.height,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            child: SideMenu(
              context: context,
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(isSideMenuClosed ? 0 : 24),
                  ),
                  child: _pages[_selectedIndex],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 20,
            left: isSideMenuClosed ? 0 : 220,
            child: MenuButton(
              onTap: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                  artboard,
                  stateMachineName: "State Machine",
                );
                isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                isSideBarClosed.value = true;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HistorySessionsScreen extends StatelessWidget {
  const HistorySessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("History Sessions Screen",
          style: Theme.of(context).textTheme.titleLarge),
    );
  }
}


