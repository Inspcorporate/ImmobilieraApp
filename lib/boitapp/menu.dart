import 'package:flutter/material.dart';
import 'package:misoa/bigin/utilise.dart';
import 'package:misoa/boitapp/action/assis.dart';
import 'package:misoa/boitapp/action/vente.dart';
import 'package:misoa/boitapp/action/wait.dart';
import 'package:misoa/boitapp/proile.dart';
import 'package:misoa/boitapp/search.dart';
import 'package:misoa/boitapp/visite.dart';
import 'package:misoa/makets/accueil.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currenScreen = const Accueil();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'MISOA',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.red,
              child: Center(
                child: Row(
                  children: [
                    Image.network(
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680881810/mo_gwvrih.png",
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const Text(
                      'MISOA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currenScreen = Accueil();
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text('Explore'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currenScreen = const FirstPage();
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.sell_outlined),
              title: const Text('vendre'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currenScreen = Vendre();
                  _selectedIndex = 2;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currenScreen = Profile();
                  _selectedIndex = 3;
                });
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                ); // Naviguer vers la page de paramètres
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Aide'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const assistPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const condiPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaqPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(),
        child: PageStorage(
          bucket: bucket,
          child: currenScreen,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyPage(),
              ));
        },
        child: Icon(
          Icons.search,
          color: _selectedIndex == 0 ? Colors.white : Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 20,
        child: Container(
          height: MediaQuery.of(context).size.width * 0.2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          currenScreen = Accueil();
                          _selectedIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color:
                                _selectedIndex == 0 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Accueil',
                            style: TextStyle(
                                color: _selectedIndex == 0
                                    ? Colors.red
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currenScreen = FirstPage();
                          _selectedIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            color:
                                _selectedIndex == 1 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Explore',
                            style: TextStyle(
                                color: _selectedIndex == 1
                                    ? Colors.red
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currenScreen = const Vendre();
                          _selectedIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sell_rounded,
                            color:
                                _selectedIndex == 2 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Vendre',
                            style: TextStyle(
                                color: _selectedIndex == 2
                                    ? Colors.red
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 30,
                      onPressed: () {
                        setState(() {
                          currenScreen = Profile();
                          _selectedIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color:
                                _selectedIndex == 3 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                color: _selectedIndex == 3
                                    ? Colors.red
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
