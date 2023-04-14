import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misoa/boitapp/achat.dart';
import 'package:misoa/boitapp/action/Relooking.dart';
import 'package:misoa/boitapp/action/loaction.dart';
import 'package:misoa/boitapp/action/vente.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class dashboad extends StatefulWidget {
  const dashboad({super.key});

  @override
  State<dashboad> createState() => _dashboadState();
}

class _dashboadState extends State<dashboad> {
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
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680881810/mo_gwvrih.png",
                      height: 200,
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const wainting1(),
                                  ),
                                );
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const wainting2(),
                                  ),
                                );
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
                                Navigator.pushReplacement(
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
                                Navigator.pushReplacement(
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
          () => Navigator.pushReplacement(
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
          () => Navigator.pushReplacement(
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

class wainting1 extends StatefulWidget {
  const wainting1({super.key});

  @override
  State<wainting1> createState() => _wainting1State();
}

class _wainting1State extends State<wainting1> {
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
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Relooking(),
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

class wainting2 extends StatefulWidget {
  const wainting2({super.key});

  @override
  State<wainting2> createState() => _wainting2State();
}

class _wainting2State extends State<wainting2> {
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
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Vendre(),
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
