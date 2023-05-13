import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misoa/boitapp/action/vente.dart';

class CircilePage extends StatefulWidget {
  const CircilePage({super.key});

  @override
  State<CircilePage> createState() => _CircilePageState();
}

class _CircilePageState extends State<CircilePage> {
  Timer? _timer;
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
          const Duration(seconds: 1),
          () => Navigator.push(
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
