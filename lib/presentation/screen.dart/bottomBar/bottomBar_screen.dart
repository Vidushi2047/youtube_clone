// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/util/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.shell,
  }) : super(key: key);
  final StatefulNavigationShell shell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(fontFamily: 'Roboto-Regular'),
            selectedLabelStyle: const TextStyle(fontFamily: 'Roboto-Regular'),
            elevation: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              shell.goBranch(index);
            },
            currentIndex: shell.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Icon(Icons.explore),
                  label: "Shorts"),
              BottomNavigationBarItem(
                  icon: FaIcon(Icons.add_circle_outline),
                  activeIcon: Icon(Icons.add_circle),
                  label: "add"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.subscriptions_outlined),
                  activeIcon: Icon(Icons.subscriptions),
                  label: "subscription"),
              BottomNavigationBarItem(
                  // icon: Icon(Icons.video_library_outlined),
                  // activeIcon: Icon(Icons.video_library),
                  icon: Icon(Icons.person_outline_rounded),
                  activeIcon: Icon(Icons.video_library),
                  label: "you")
            ]),
        body: shell);
  }
}
