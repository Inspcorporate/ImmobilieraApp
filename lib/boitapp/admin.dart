import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misoa/boitapp/achat.dart';
import 'package:misoa/boitapp/action/loaction.dart';
import 'package:misoa/boitapp/action/vente.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:misoa/boitapp/affiche.dart';

// ignore: camel_case_types
class dashboad extends StatefulWidget {
  const dashboad({super.key});

  @override
  State<dashboad> createState() => _dashboadState();
}

// ignore: camel_case_types
class _dashboadState extends State<dashboad> {
  bool _isConnected = true;
  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity().then((value) {
      setState(() {
        _isConnected = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: Image(
                image: AssetImage('images/co.jpg'),

                fit: BoxFit.cover,
                height: MediaQuery.of(context)
                    .size
                    .height, // Set the opacity value between 0.0 to 1.0
              ),
            ),
            Column(children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.redAccent],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                  child: Center(
                    child: Image.network(
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1681736417/LOGO_INSP_DEF-12_uhbnni.png",
                      height: MediaQuery.of(context).size.height,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Empty space

                    // Empty space
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (_isConnected) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AffichPage(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "No internet connection available"),
                                    ),
                                  );
                                }
                              },
                              child: Image(
                                  image: const AssetImage('images/rel.png'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width: 150),
                            ),
                            // Empty space
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (_isConnected) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Vendre(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "No internet connection available"),
                                    ),
                                  );
                                }
                              },
                              child: Image(
                                  image: const AssetImage('images/ven.png'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width: 150),
                            ), // Icon color
                            // Icon size
                          ],
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const waiting(),
                                  ),
                                );
                              },
                              child: Image(
                                  image: const AssetImage('images/loc.png'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width: 150),
                            ),
                            const SizedBox(height: 10), // Empty space
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const waitingPage(),
                                  ),
                                );
                              },
                              child: Image(
                                  image: const AssetImage('images/ach.png'),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width: 150),
                            ),
                            // Empty space
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class waitingPage extends StatefulWidget {
  const waitingPage({super.key});

  @override
  State<waitingPage> createState() => _waitingPageState();
}

class _waitingPageState extends State<waitingPage> {
  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    checkInternetConnectivity().then((internet) {
      if (internet == true) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MODIFER(),
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Erreur de connexion"),
            content:
                const Text("Vérifiez votre connexion internet et réessayez."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}

class waiting extends StatefulWidget {
  const waiting({super.key});

  @override
  State<waiting> createState() => _waitingState();
}

class _waitingState extends State<waiting> {
  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    checkInternetConnectivity().then((internet) {
      if (internet == true) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Locatio(),
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Erreur de connexion"),
            content:
                const Text("Vérifiez votre connexion internet et réessayez."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
