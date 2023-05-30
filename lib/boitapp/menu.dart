import 'package:flutter/material.dart';
import 'package:misoa/bigin/utilise.dart';
import 'package:misoa/boitapp/action/Relooking.dart';
import 'package:misoa/boitapp/action/assis.dart';
import 'package:misoa/boitapp/action/circuleP.dart';
import 'package:misoa/boitapp/action/wait.dart';
import 'package:misoa/boitapp/affiche.dart';
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
  Widget currenScreen = const FirstPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Row(
            children: [
              Image.network(
                "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680881810/mo_gwvrih.png",
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                'MISOA',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/co.jpg"), fit: BoxFit.cover),
          ),
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
                leading: const Icon(Icons.home_work),
                title: const Text('Accueil'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    currenScreen = FirstPage();
                    _selectedIndex = 0;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Recherche'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    currenScreen = const Accueil();
                    _selectedIndex = 1;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.sell_outlined),
                title: const Text('en vente'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    currenScreen = AffichPage();
                    _selectedIndex = 2;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.person_2_outlined),
                title: Text('Profil'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    currenScreen = ProTest();
                    _selectedIndex = 3;
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 1,
                color: const Color.fromARGB(255, 71, 70, 70),
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
                title: const Text('Aide'),
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
                leading: const Icon(Icons.question_answer),
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
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(),
          child: PageStorage(
            bucket: bucket,
            child: currenScreen,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 30,
        child: SizedBox(
          height: MediaQuery.of(context).size.height *
              0.08, // ajustez la hauteur en conséquence
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width *
                          0.1, // ajustez la largeur en conséquence
                      onPressed: () {
                        setState(() {
                          currenScreen = const FirstPage();
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
                      minWidth: MediaQuery.of(context).size.width *
                          0.1, // ajustez la largeur en conséquence
                      onPressed: () {
                        setState(() {
                          currenScreen = Accueil();
                          _selectedIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_outlined,
                            color:
                                _selectedIndex == 1 ? Colors.red : Colors.grey,
                          ),
                          Text(
                            'Recherche',
                            style: TextStyle(
                                color: _selectedIndex == 1
                                    ? Colors.red
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width *
                          0.1, // ajustez la largeur en conséquence
                      onPressed: () {
                        setState(() {
                          currenScreen = const CircilePage();
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
                      minWidth: MediaQuery.of(context).size.width *
                          0.1, // ajustez la largeur en conséquence
                      onPressed: () {
                        setState(() {
                          currenScreen = ProTest();
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
                            'Profil',
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
