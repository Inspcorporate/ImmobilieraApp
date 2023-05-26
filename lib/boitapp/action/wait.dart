import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/boitapp/visite.dart';

class Tour extends StatefulWidget {
  const Tour({super.key});

  @override
  State<Tour> createState() => _TourState();
}

class _TourState extends State<Tour> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FirstPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class FaqPage extends StatelessWidget {
  final List<Faq> faqs = [
    Faq(
      question: 'Comment puis-je Vous retouver ?',
      answer:
          "Vous pouvez  vous rendres a COCODY RIVIERA PALMERAIS non loin du ROUND POINT SAINT VIATEUR.",
    ),
    Faq(
      question: 'Comment puis-je acheter une propriété ?',
      answer:
          'Vous pouvez parcourir les propriétés disponibles dans l\'application et cliquer sur JE VEUX et suiver la procedure ou contacter l\'agent immobilier dans la partie aide pour organiser une visite ou pour obtenir plus d\'informations.',
    ),
    Faq(
      question: 'Comment puis-je vendre ma propriété ?',
      answer:
          'Vous pouvez remplire notre formulaire pour etre elible sur Misoa, ou Vous pouvez contacter un agent immobilier pour mettre votre propriété en vente et discuter des options disponibles pour la vendre.',
    ),
    Faq(
      question: 'Comment puis-je modifier mes préférences de recherche ?',
      answer:
          'Vous pouvez accéder à vos préférences de recherche dans les paramètres de l\'application et les modifier à tout moment.',
    ),
    Faq(
      question: 'Comment puis-je louer une propriété ?',
      answer:
          "Vous pouvez parcourir les biens  disponible dans la section location de l'application et suivre les instructions pour que votre pocedure soit validé.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ));
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text('FAQ'),
          ),
          body: ListView.builder(
            itemCount: faqs.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                textColor: Colors.grey,
                title: Text(faqs[index].question),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(faqs[index].answer),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Faq {
  final String question;
  final String answer;

  Faq({required this.question, required this.answer});
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;
  bool _areNotificationsEnabled = true;
  String _selectedLanguage = 'Français';

  void _showPrivacyAndSecurityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confidentialité et Sécurité'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ajoutez ici les informations sur la confidentialité et la sécurité
                Text(
                    'Chez Misoa, nous priorisons la confidentialité et la sécurité des informations de nos utilisateurs. Nous nous engageons à protéger la vie privée de toutes les personnes qui interagissent avec notre application d\'immobilité. Cette déclaration de confidentialité décrit notre approche pour protéger les données sensibles et garantir les normes de confidentialité les plus élevées..'),
                Text(
                    'Mesures de protection des données :\n Nous mettons en œuvre des mesures de sécurité robustes pour protéger les données personnelles et sensibles contre tout accès, modification, divulgation ou destruction non autorisés.\n Nous utilisons des techniques de cryptage standard de l\'industrie pour assurer la confidentialité de la transmission des données entre les utilisateurs et nos serveurs.\n L\'accès aux données de l\'utilisateur est strictement limité au personnel autorisé qui en a besoin pour effectuer les tâches qui lui sont assignées.'),
                Text(
                    'Collecte et utilisation des informations :Nous recueillons uniquement les informations nécessaires pour fournir efficacement nos services d\'immobilité.Les données personnelles, telles que les noms, adresses et coordonnées, sont collectées avec le consentement explicite de l\'utilisateur et sont utilisées uniquement dans le but de fournir les services demandés.Nous ne partageons, vendons ou louons aucune donnée personnelle à des tiers, sauf autorisation explicite de l\'utilisateur ou requise par la loi.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Menu(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Paramètres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apparence',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: const Text('Mode sombre'),
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;
                });
              },
            ),
            Divider(),
            const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Activer les notifications'),
              value: _areNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _areNotificationsEnabled = value;
                });
              },
            ),
            Divider(),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // Action à effectuer lorsque le bouton est pressé
                    _showPrivacyAndSecurityDialog();
                  },
                  child: const Text(
                    'Confidentialité et Sécurité',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // Action à effectuer lorsque le bouton est pressé
                  },
                  child: const Text(
                    'Changer mot de pass',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Langue',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButtonFormField<String>(
              value: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
              items: <String>['Français', 'Anglais']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
