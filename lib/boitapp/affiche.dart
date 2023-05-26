// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class AffichPage extends StatefulWidget {
  const AffichPage({super.key});

  @override
  State<AffichPage> createState() => _AffichPageState();
}

class _AffichPageState extends State<AffichPage> {
  Future<List<dynamic>> getData() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://s-p4.com/konan/misoa/affich.php');

      if (response.statusCode == 200) {
        if (response.data is Map && response.data.containsKey('data')) {
          List<dynamic> data = response.data['data'];
          return data;
        } else {
          print("Invalid response format: 'data' key is missing");
          return [];
        }
      } else {
        print("Request failed with status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    double hori = MediaQuery.of(context).size.height;
    double verti = MediaQuery.of(context).size.width;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Liste des ventes "),
          actions: [
            IconButton(
              onPressed: () {
                getData();
              },
              icon: const Icon(Icons.refresh_outlined),
            ),
          ],
        ),
        body: FutureBuilder<List<dynamic>>(
            future: getData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Une erreur s\'est produite'),
                );
              } else {
                List<dynamic> data = snapshot.data!;
                return SizedBox(
                  height: hori,
                  width: verti,
                  child: data.isEmpty
                      ? const Center(
                          child: Text(
                            'Pas de bien en vente',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width,
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Image.network(
                                              "https://s-p4.com/konan/misoa/${data[index]["file"]}",
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              bottom: 10.0,
                                              left: 10.0,
                                              child: Column(
                                                children: [
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        side: const BorderSide(
                                                            width: 1),
                                                        backgroundColor:
                                                            const Color
                                                                    .fromARGB(
                                                                18, 12, 11, 19),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    DetailsPage(
                                                              image:
                                                                  "https://s-p4.com/konan/misoa/${data[index]["file"]}",
                                                              title: data[index]
                                                                  ["nature"],
                                                              description: data[
                                                                      index][
                                                                  "description"],
                                                              status: data[
                                                                      index][
                                                                  "localisation"],
                                                              chambre: data[
                                                                          index]
                                                                      [
                                                                      "chambre"] ??
                                                                  0,
                                                              douche: data[
                                                                          index]
                                                                      [
                                                                      "douche"] ??
                                                                  0,
                                                              garage: data[
                                                                          index]
                                                                      [
                                                                      "garage"] ??
                                                                  0,
                                                              dateb: data[index]
                                                                  ["datebi"],
                                                              codem: data[index]
                                                                  ["id_b"],
                                                              user: data[index][
                                                                  "utilisateur"],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child:
                                                          const Text('Detail')),
                                                  const SizedBox(height: 10.0),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    color: Colors.grey,
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Text(
                                                    data[index]["localisation"],
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: verti * 0.5),
                                                  const CircleAvatar(
                                                    radius: 20,
                                                    child: Image(
                                                        image: AssetImage(
                                                            'images/vrai.png')),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10.0),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Publié le ${data[index]["datebi"]}",
                                                    ),
                                                    Text(
                                                      data[index]["nature"],
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons
                                                                .bed_rounded),
                                                            Text(
                                                              data[index][
                                                                      "chambre"]
                                                                  .toString(),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(Icons
                                                                .shower_outlined),
                                                            Text(
                                                              data[index]
                                                                      ["douche"]
                                                                  .toString(),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(Icons
                                                                .car_rental),
                                                            Text(
                                                              data[index]
                                                                      ["garage"]
                                                                  .toString(),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                );
              }
            }),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String status;
  final String chambre;
  final String douche;
  final String garage;
  final String dateb;
  final String codem;
  final String user;

  DetailsPage(
      {super.key,
      required this.title,
      required this.image,
      required this.description,
      required this.status,
      required this.chambre,
      required this.douche,
      required this.garage,
      required this.dateb,
      required this.user,
      required this.codem});

  bool _isInterested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Details'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                    ),
                    ListTile(
                      leading: const Icon(Icons.date_range),
                      title: const Text('date'),
                      subtitle: Text("publié le $dateb"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.house_sharp),
                      title: const Text('type'),
                      subtitle: Text(title),
                    ),
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: const Text('Description'),
                      subtitle: Text(description),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text('Localisation'),
                      subtitle: Text(status),
                    ),
                    ListTile(
                      leading: const Icon(Icons.shower),
                      title: const Text('douche'),
                      subtitle: Text(douche.toString()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.bed),
                      title: const Text('chambre'),
                      subtitle: Text(chambre.toString()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.car_rental),
                      title: const Text('garage'),
                      subtitle: Text(garage.toString()),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Propriétaire'),
                      subtitle: Text("MI23${user.toString()}"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Propriété"),
                      subtitle: Text("MI23${codem.toString()}"),
                    ),
                    Row(
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) {
                            return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isInterested = true;
                                });
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Intéressé'),
                                      content: const Text(
                                          'Vous êtes maintenant intéressé !'),
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
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    _isInterested ? Colors.green : Colors.red,
                              ),
                              child: Text(
                                  _isInterested ? 'Intéressé !' : 'Intéresser'),
                            );
                          },
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            // launch('tel//$number');
                            // await FlutterPhoneDirectCaller.callNumber(number);
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: "+2250709171734",
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print('Le numero ne fonction plus');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 24, 82, 255),
                              maximumSize: Size(180, 40)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 40,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              Text(
                                'Telephone',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
