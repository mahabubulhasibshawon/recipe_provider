import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(tabs: [
        GButton(icon: Icons.home,),
        GButton(icon: Icons.search_sharp),
        GButton(icon: Icons.notification_important),
        GButton(icon: Icons.person),
      ]),
    );
  }
}
