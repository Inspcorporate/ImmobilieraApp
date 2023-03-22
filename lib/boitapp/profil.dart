import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:misoa/identic/login.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map data = {};
  bool isLoading = false;
  int userId = 3;

  Future<Map> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ?? 0;
    if (userId == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      );
      return {};
    }
    setState(() {
      isLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://yakinci.com/misoa/get_profile.php?id=$userId'));
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
    return data;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 80.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  '${data['prenom']} ${data['nom']}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                // Text(
                //   // data['email'],
                //   style: TextStyle(fontSize: 16.0),
                // ),
                SizedBox(height: 10.0),
                // Text(
                //   data['numero'],
                //   style: TextStyle(fontSize: 16.0),
                // ),
              ],
            ),
    );
  }
}
