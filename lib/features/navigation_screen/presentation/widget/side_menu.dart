// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lighthouse_web_app/common/widget/my_button.dart';
import 'package:rive/rive.dart';

import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:lighthouse_web_app/core/utils/responsive.dart';
import 'package:lighthouse_web_app/core/utils/rive_utils.dart';
import 'package:lighthouse_web_app/core/utils/task_notifier.dart';
import 'package:lighthouse_web_app/features/navigation_screen/presentation/widget/info_card.dart';
import 'package:lighthouse_web_app/features/navigation_screen/presentation/widget/rive_asset.dart';
import 'package:lighthouse_web_app/features/navigation_screen/presentation/widget/side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  BuildContext context;
  SideMenu({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        decoration: BoxDecoration(
          color: navy,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/svg/en-logo.svg',
                        width: 200,
                      ),
                    ),
                  // else
                  SizedBox(height: 30),
                    InfoCard(
                      firstName: "Anas",
                      lastName: "Barakat",
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 23, bottom: 16),
                    child: Text(
                      "browse".toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white70),
                    ),
                  ),
                  ...sideMenus.map(
                    (e) => SideMenuTile(
                      menu: e,
                      riveOnInit: (artboard) {
                        StateMachineController? controller =
                            RiveUtils.getRiveController(artboard,
                                stateMachineName: e.stateMachineName);
                        var inputSMI = controller.findSMI("active");
                        e.input = inputSMI;
                      },
                      press: () {
                        setState(() {
                          selectedMenu = e;
                        });
                        try {
                          e.input!.change(true);
                          Future.delayed(Duration(seconds: 1), () {
                            e.input!.change(false);
                          });
                        } catch (e) {
                          print(e);
                        }
                        indexNotifier.value = e.index;
                      },
                      isActive: selectedMenu == e,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 23, bottom: 16),
                    child: Text(
                      "history".toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ),
                  ...historyMenu.map(
                    (e) => SideMenuTile(
                      menu: e,
                      riveOnInit: (artboard) {
                        StateMachineController? controller =
                            RiveUtils.getRiveController(artboard,
                                stateMachineName: e.stateMachineName);
                        var inputSMI = controller.findSMI("active");
                        e.input = inputSMI;
                      },
                      press: () {
                        setState(() {
                          selectedMenu = e;
                        });
                        e.input!.change(true);
                        Future.delayed(Duration(seconds: 1), () {
                          e.input!.change(false);
                        });
                      },
                      isActive: selectedMenu == e,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,right: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: MyButton(
                        onPressed: () {},
                        color: navy,
                        side: BorderSide(color: orange, width: 1),
                        child: Text(
                          "Log Out",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: orange,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
