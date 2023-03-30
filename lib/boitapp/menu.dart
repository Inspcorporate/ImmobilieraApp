import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:misoa/boitapp/action/actulit.dart';
import 'package:misoa/boitapp/action/wait.dart';
import 'package:misoa/boitapp/admin.dart';
import 'package:misoa/boitapp/proile.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetoptions = <Widget>[
    dashboad(),
    Tour(),
    ActulitiPage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetoptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              activeColor: Colors.red,
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              color: Colors.grey,
              curve: Curves.easeInCubic,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'home',
                ),
                GButton(
                  icon: Icons.home_repair_service,
                  text: 'Proprieté',
                ),
                GButton(
                  icon: Icons.newspaper_outlined,
                  text: 'News',
                ),
                GButton(
                  icon: Icons.person_2_outlined,
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
