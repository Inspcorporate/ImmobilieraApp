import 'package:flutter/material.dart';
import 'package:misoa/boitapp/action/actulit.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int _choixindex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const AchatPages(),
    const AchatPages(),
    const RelookPge(),
    FackPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _choixindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/fon.jpg'),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              ),
              const Positioned(
                top: 60,
                left: 100,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/vrai.png'),
                      radius: 30,
                    ),
                    Text(
                      'MISOA',
                      style: TextStyle(
                          fontFamily: 'beroKC',
                          fontSize: 30,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: const Center(
                      child: Text(
                        'Achat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'beroKC',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      color: _choixindex == 0 ? Colors.red : Colors.grey,
                      onPressed: () {
                        _onItemTapped(0);
                      },
                    ),
                    Text(
                      'ACHAT',
                      style: TextStyle(
                        color: _choixindex == 0 ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.key),
                      color: _choixindex == 1 ? Colors.red : Colors.grey,
                      onPressed: () {
                        _onItemTapped(1);
                      },
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                        color: _choixindex == 1 ? Colors.red : Colors.grey,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.brush),
                      color: _choixindex == 2 ? Colors.red : Colors.grey,
                      onPressed: () {
                        _onItemTapped(2);
                      },
                    ),
                    Text(
                      'Relooking',
                      style: TextStyle(
                        color: _choixindex == 2 ? Colors.red : Colors.grey,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.support_agent),
                      color: _choixindex == 3 ? Colors.red : Colors.grey,
                      onPressed: () {
                        _onItemTapped(3);
                      },
                    ),
                    Text(
                      'Conseil',
                      style: TextStyle(
                        color: _choixindex == 3 ? Colors.red : Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Center(
                child: _widgetOptions.elementAt(_choixindex),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
