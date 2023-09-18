import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Bien {
  final String titre;
  final String description;
  final double prix;
  final String image;
  final String localisation;
  final String transaction;

  Bien({
    required this.titre,
    required this.description,
    required this.prix,
    required this.image,
    required this.localisation,
    required this.transaction,
  });

  factory Bien.fromJson(Map<String, dynamic> json) {
    return Bien(
      titre: json['titre'],
      description: json['description'],
      prix: double.parse(json['prix']),
      image: json['image'],
      localisation: json['localisation'],
      transaction: json['transaction'],
    );
  }
}

class Payement extends StatefulWidget {
  const Payement({super.key});

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  List<Bien> _biens = [];

  @override
  void initState() {
    super.initState();
    _getBiens();
  }

  Future<void> _getBiens() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://inspcorporate.com/misoa/achat.php');

      if (response.statusCode == 200) {
        if (response.data is Map && response.data.containsKey('data')) {
          List<dynamic> data = response.data['data'];
          setState(() {
            _biens = data.map((json) => Bien.fromJson(json)).toList();
          });
        } else {
          print("Invalid response format: 'data' key is missing");
        }
      } else {
        print("Request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  bool _isInterested = false;
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return SafeArea(
      minimum: const EdgeInsets.only(top: 20),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Achat',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.notifications,
                  size: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: hauteur,
          width: largeur,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            ),
                            label: Text(
                              'Recherche...',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(179, 239, 4, 4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.tune_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text('Liste des biens'),
                    SizedBox(
                      height: hauteur * 0.5,
                      width: largeur,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 4.3 / 5,
                          ),
                          itemCount: _biens.length,
                          itemBuilder: (context, index) {
                            Bien bien = _biens[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(bien: bien),
                                  ),
                                );
                              },
                              child: _buildBienCard(bien),
                            );
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBienCard(Bien bien) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3, // Ratio hauteur / largeur pour l'image
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  "https://inspcorporate.com/misoa/${bien.image}",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                IconButton(
                  icon: Icon(
                    _isInterested
                        ? Icons.turned_in
                        : Icons.turned_in_not_outlined,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: () {
                    // Action lorsque l'icône "turned_in" est cliquée
                    setState(() {
                      _isInterested = true;
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Intéressé'),
                          content:
                              const Text('Vous êtes maintenant intéressé !'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              bien.titre,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  '${bien.prix} \$',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final bien;
  const DetailPage({required this.bien});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bien.titre),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  "https://inspcorporate.com/misoa/${bien.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.house_sharp),
                    title: const Text('Type'),
                    subtitle: Text(
                      bien.titre,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.money_outlined),
                    title: const Text('Prix'),
                    subtitle: Text(
                      '${bien.prix}\$',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: const Text('Description'),
                    subtitle: Text(
                      bien.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Locationtion'),
                    subtitle: Text(bien.localisation),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.call_to_action),
                    title: const Text('Transaction'),
                    subtitle: Text(bien.transaction),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
