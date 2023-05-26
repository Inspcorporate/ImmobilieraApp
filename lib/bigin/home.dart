import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/identic/login.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:misoa/identic/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: checkConnection(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != -1) {
          return const Circular();
        } else {
          // L'utilisateur n'est pas connecté, rediriger vers la page de connexion
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/user.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'MISOA',
                    style: TextStyle(
                      fontFamily: 'beroKC',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/vrai.png'),
                    radius: 80,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 50),
                      primary: Colors.white,
                    ),
                    child: const Text(
                      "S'INSCRIRE",
                      style: TextStyle(
                        fontFamily: 'beroKC',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const wainting1()),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 50),
                      primary: Colors.white,
                    ),
                    child: const Text(
                      "SE CONNECTER",
                      style: TextStyle(
                        fontFamily: 'beroKC',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const waiting()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      'OU',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(280, 50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Circular()),
                      );
                    },
                    child: const Text(
                      "CONSULTER",
                      style: TextStyle(
                        fontFamily: 'beroKC',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<int> checkConnection() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;
    return userId;
  }
}

class Circular extends StatefulWidget {
  const Circular({super.key});

  @override
  State<Circular> createState() => _CircularState();
}

class _CircularState extends State<Circular> {
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
              builder: (context) => const Menu(),
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
    ));
  }
}

class waiting extends StatefulWidget {
  const waiting({super.key});

  @override
  State<waiting> createState() => _waitingState();
}

// ignore: camel_case_types
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
              builder: (context) => const LoginPage(),
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
              builder: (context) => const RegisterPage(),
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
