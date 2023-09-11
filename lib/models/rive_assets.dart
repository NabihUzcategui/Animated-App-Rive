import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  // final String stateMachineName;
  // final String title;
  // final String src;
  late SMIBool? input;

  RiveAsset({
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    required this.src,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    artboard: 'CHAT',
    stateMachineName: 'CHAT_Interactivity',
    title: 'Chat',
    src: 'assets/RiveAssets/icons.riv',
  ),
  RiveAsset(
    artboard: 'SEARCH',
    stateMachineName: 'SEARCH_Interactivity',
    title: 'Search',
    src: 'assets/RiveAssets/icons.riv',
  ),
  RiveAsset(
    artboard: 'TIMER',
    stateMachineName: 'TIMER_Interactivity',
    title: 'Timer',
    src: 'assets/RiveAssets/icons.riv',
  ),
  RiveAsset(
    artboard: 'BELL',
    stateMachineName: 'BELL_Interactivity',
    title: 'Notifications',
    src: 'assets/RiveAssets/icons.riv',
  ),
  RiveAsset(
    artboard: 'USER',
    stateMachineName: 'USER_Interactivity',
    title: 'Profile',
    src: 'assets/RiveAssets/icons.riv',
  ),
];