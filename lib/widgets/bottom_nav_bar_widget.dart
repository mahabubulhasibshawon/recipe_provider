import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/screens.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(tabs: [
        GButton(icon: Icons.home,onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },),
        GButton(icon: Icons.search_sharp),
        GButton(icon: Icons.favorite_border, onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()));
        },),
        GButton(icon: Icons.person),
      ]),
    );
  }
}
