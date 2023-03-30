
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void disconnectUser(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
}


// Utilisation de la fonction pour déconnecter l'utilisateur et retourner à la page de connexion

