// ignore_for_file: unnecessary_null_comparison, unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AffichPage extends StatefulWidget {
  const AffichPage({super.key});

  @override
  State<AffichPage> createState() => _AffichPageState();
}

class _AffichPageState extends State<AffichPage> {
  List<dynamic> data = [];
  Future<String> getData() async {
    var response = await http.get(Uri.parse(
        "https://s-p4.com/konan/misoa/affich.php")); //remplacez l'url avec votre propre url de l'API PHP
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body)['data'];
      });
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des vente"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      title: data[index]["nature"],
                      image:
                          "https://s-p4.com/konan/misoa/${data[index]["imag"]}",
                      description: data[index]["description"],
                      status: data[index]["localisation"],
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://s-p4.com/konan/misoa/${data[index]["imag"]}"),
                ),
                title: Text(data[index]["nature"]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String status;

  DetailsPage(
      {required this.title,
      required this.image,
      required this.description,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image),
            SizedBox(height: 20),
            Text(description),
            SizedBox(height: 20),
            Text(status),
          ],
        ),
      ),
    );
  }
}
