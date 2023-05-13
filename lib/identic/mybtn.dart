import 'package:flutter/material.dart';
import 'package:misoa/boitapp/affiche.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Villechoisie extends StatefulWidget {
  final String ville;
  const Villechoisie({super.key, required this.ville});

  @override
  State<Villechoisie> createState() => _VillechoisieState();
}

class _VillechoisieState extends State<Villechoisie> {
  List<dynamic> data = [];
  Future<String> getData() async {
    try {
      var response = await http
          .post(Uri.parse("https://s-p4.com/konan/misoa/recher.php"), body: {
        "ville": widget.ville,
      });

      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body)['data'];
        });
      } else {
        throw Exception("Erreur ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
      throw Exception(
          "Une erreur s'est produite lors de la récupération des données");
    }

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double hori = MediaQuery.of(context).size.height;
    double verti = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Bien present à ${widget.ville}"),
        ),
        body: SizedBox(
          height: hori,
          width: verti,
          child: ListView.builder(
            itemCount: data == Null ? 0 : data.length,
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
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                "https://s-p4.com/konan/misoa/${data[index]["file"]}",
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10.0,
                                left: 10.0,
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            side: const BorderSide(width: 1),
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    18, 12, 11, 19)),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                image:
                                                    "https://s-p4.com/konan/misoa/${data[index]["file"]}",
                                                title: data[index]["nature"],
                                                description: data[index]
                                                    ["description"],
                                                status: data[index]
                                                    ["localisation"],
                                                chambre:
                                                    data[index]["chambre"] ?? 0,
                                                douche:
                                                    data[index]["douche"] ?? 0,
                                                garage:
                                                    data[index]["garage"] ?? 0,
                                                dateb: data[index]["datebi"],
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text('Detail')),
                                    SizedBox(height: 10.0),
                                    Text(
                                      "Publié le ${data[index]["datebi"]}",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      data[index]["localisation"],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                              Icon(Icons.bed_rounded),
                                              Text(
                                                data[index]["chambre"]
                                                    .toString(),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.shower_outlined),
                                              Text(
                                                data[index]["douche"]
                                                    .toString(),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.car_rental),
                                              Text(
                                                data[index]["garage"]
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
        ),
      ),
    );
  }
}
