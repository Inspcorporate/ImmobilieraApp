import 'package:flutter/material.dart';
import 'package:misoa/boitapp/affiche.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AchatPages extends StatefulWidget {
  const AchatPages({Key? key});

  @override
  State<AchatPages> createState() => _AchatPagesState();
}

class _AchatPagesState extends State<AchatPages> {
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: hauteur,
        width: largeur,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  text: 'Appartement',
                  selected: selectedOption == 'Appartement',
                  onTap: () {
                    setState(() {
                      selectedOption = 'Appartement';
                    });
                  },
                ),
                RoundedButton(
                  text: 'Terrain',
                  selected: selectedOption == 'Terrain',
                  onTap: () {
                    setState(() {
                      selectedOption = 'Terrain';
                    });
                  },
                ),
                RoundedButton(
                  text: 'Villa',
                  selected: selectedOption == 'Villa',
                  onTap: () {
                    setState(() {
                      selectedOption = 'Villa';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BottomBar(selectedOption: selectedOption),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const RoundedButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.red.shade200 : Colors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final String selectedOption;

  const BottomBar({super.key, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (selectedOption == 'Appartement') {
      content = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'NORD',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Ouest',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Centre',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'EST',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AffichPage()));
                  },
                  child: const Text(
                    'SUD',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      );
    } else if (selectedOption == 'Terrain') {
      content = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'NORD',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Ouest',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Centre',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'EST',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AffichPage()));
                  },
                  child: const Text(
                    'SUD',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      );
    } else if (selectedOption == 'Villa') {
      content = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'NORD',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Ouest',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Centre',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'EST',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 30,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AffichPage()));
                  },
                  child: const Text(
                    'SUD',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      );
    } else {
      content = Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'Aucune option sélectionnée',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: content,
    );
  }
}

class RelookPge extends StatefulWidget {
  const RelookPge({super.key});

  @override
  State<RelookPge> createState() => _RelookPgeState();
}

class _RelookPgeState extends State<RelookPge> {
  TextEditingController inform = TextEditingController();
  final _formKey = GlobalKey();
  void relook() async {
    final prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;
    var url = 'https://s-p4.com/konan/misoa/bien.php';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['id_user'] = userId.toString();
    request.fields['inform'] = inform.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: TextFormField(
                  controller: inform,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre nom svp';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                    labelText: 'Vous souhaitez relooker?',
                  ),
                )),
            const SizedBox(height: 16.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(100, 50),
                  backgroundColor: const Color.fromRGBO(244, 67, 54, 1),
                ),
                onPressed: () {
                  relook();
                },
                child: const Text(
                  'Valider',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),)
          ],
        ),
      ),
    );
  }
}

class FackPage extends StatelessWidget {
  final List<Faq> faqs = [
    Faq(
      question: 'Rechercher un Conseiller Immobilier?',
      answer: '+2250708171734',
    ),
    Faq(
      question: 'Recherche un Notaire ?',
      answer: '+225 0708171734',
    ),
    Faq(
      question: 'Autre?', 
      answer: '+225 0708171734',
    ),
  ];

  FackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Scaffold(
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
