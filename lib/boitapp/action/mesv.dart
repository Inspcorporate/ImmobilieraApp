// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MesVente extends StatefulWidget {
  const MesVente({super.key});

  @override
  State<MesVente> createState() => _MesVenteState();
}

class _MesVenteState extends State<MesVente> {
  List<dynamic> person = [];

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;

    final response = await http.post(
      Uri.parse("https://s-p4.com/konan/misoa/perso.php"),
      body: {
        "id": userId.toString(),
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        person = jsonDecode(response.body)['person'];
      });
    }
    return;
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    double hori = MediaQuery.of(context).size.height;
    double verti = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
      height: hori,
      width: verti,
      child: ListView.builder(
        itemCount: person == Null ? 0 : person.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1, color: Color.fromARGB(221, 183, 182, 182))),
              child: Row(children: [
                Image.network(
                  "https://s-p4.com/konan/misoa/${person[index]["file"]}",
                  height: hori * 0.2,
                  width: verti * 0.2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.network(
                  "https://s-p4.com/konan/misoa/${person[index]["imag"]}",
                  height: hori * 0.2,
                  width: verti * 0.2,
                ),
                Column(
                  children: [
                    Text("Publié le:\n ${person[index]['datebi']}"),
                    Text(person[index]['description']),
                    Text(person[index]['nature']),
                    Text(person[index]['localisation']),
                  ],
                )
              ]),
            ),
          );
        },
      ),
    ));
  }
}
