// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:misoa/boitapp/action/mesv.dart';
import 'package:misoa/boitapp/ass.dart';
import 'package:misoa/boitapp/porfil1.dart';
import 'package:misoa/identic/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProTest extends StatefulWidget {
  const ProTest({super.key});

  @override
  State<ProTest> createState() => _ProTestState();
}

class _ProTestState extends State<ProTest> {
  int _selectedIndex = 0;
  String _username = "";
  String prenom = "";
  String numero = "";
  String email = "";
  String localisa = "";
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;

    final response = await http.post(
      Uri.parse("https://s-p4.com/konan/misoa/mobile.php"),
      body: {
        "id": userId.toString(),
      },
    );

    final data = jsonDecode(response.body);

    setState(() {
      _username = data["username"] ?? '';
      prenom = data["prenom"] ?? '';
      numero = data["numero"] ?? '';
      localisa = data["localisa"] ?? '';
      email = data["email"] ?? '';
    });
  }

  void disconnectUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    Profil1(),
    MesVente(),
    HelpPge(),
    Text('Contenu 4'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double enhaut = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SizedBox(
      height: enhaut,
      width: largeur,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: largeur,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.redAccent],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
          ),
          const Positioned(
            top: 10,
            left: 140,
            right: 150,
            child: Text(
              'Profil',
              style: TextStyle(
                  fontSize: 24, fontFamily: 'beroKC', color: Colors.white),
            ),
          ),
          const Positioned(
            top: 40,
            left: 150,
            right: 150,
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/p.jpg'),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 40,
            right: 50,
            child: Text(
              '$prenom $_username',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'beroKC'),
              textAlign: TextAlign.center,
            ),
          )
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.person_pin_outlined),
                  color: _selectedIndex == 0 ? Colors.red : Colors.grey,
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
                Text(
                  'Profil',
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.sell_rounded),
                  color: _selectedIndex == 1 ? Colors.red : Colors.grey,
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
                Text(
                  'Mes Ventes',
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.red : Colors.grey,
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.help_center),
                  color: _selectedIndex == 2 ? Colors.red : Colors.grey,
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
                Text(
                  'Assistance',
                  style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.red : Colors.grey,
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.logout_outlined),
                  color: _selectedIndex == 3 ? Colors.red : Colors.grey,
                  onPressed: () {
                    disconnectUser(context);
                  },
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: _selectedIndex == 3 ? Colors.red : Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ]),
    ));
  }
}
