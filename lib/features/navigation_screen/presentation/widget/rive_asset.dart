import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  final int index;
  // final String stateMachineName;
  // final String title;
  // final String src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.index,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> sideMenus = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
    index: 0,
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "Profile",
    index: 1,
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "SETTINGS",
    stateMachineName: "SETTINGS_Interactivity",
    title: "Qr Code",
    index: 2,
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "SETTINGS",
    stateMachineName: "SETTINGS_Interactivity",
    title: "Settings",
    index: 3,
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Contact Us",
    index: 4,
  ),
];

List<RiveAsset> historyMenu = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "Past Sessions",
    index: 5,
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notification",
    index: 6,
  ),
];



  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "HOME",
  //   stateMachineName: "HOME_interactivity",
  //   title: "Home",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "BELL",
  //   stateMachineName: "BELL_Interactivity",
  //   title: "Notification",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "SEARCH",
  //   stateMachineName: "SEARCH_Interactivity",
  //   title: "Search",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "TIMER",
  //   stateMachineName: "TIMER_Interactivity",
  //   title: "Timer",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "SETTINGS",
  //   stateMachineName: "SETTINGS_Interactivity",
  //   title: "Settings",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "USER",
  //   stateMachineName: "USER_Interactivity",
  //   title: "Profile",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "LIKE/STAR",
  //   stateMachineName: "STAR_Interactivity",
  //   title: "Favorite",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "CHAT",
  //   stateMachineName: "CHAT_Interactivity",
  //   title: "Help",
  // ),
  // RiveAsset(
  //   "assets/RiveAssets/icons.riv",
  //   artboard: "AUDIO",
  //   stateMachineName: "AUDIO_Interactivity",
  //   title: "Favorite",
  // ),