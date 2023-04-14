// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:misoa/boitapp/profil.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Logpage extends StatefulWidget {
//   const Logpage({super.key});

//   @override
//   State<Logpage> createState() => _LogpageState();
// }

// class _LogpageState extends State<Logpage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final response = await http.post(
//       Uri.parse("https://yakinci.com/misoa/loginn.php"),
//       body: {
//         "email": _emailController.text,
//         "password": _passwordController.text,
//       },
//     );
//     final data = jsonDecode(response.body);

//     setState(() {
//       _isLoading = false;
//     });
//     if (data["success"] == 1) {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setInt("userId", data["id"]);
//       // ignore: use_build_context_synchronously
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ProfilePage()),
//       );
//     } else {
//       // ignore: use_build_context_synchronously
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Erreur"),
//             content: const Text("Identifiants invalides"),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       hintText: "Email",
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "Mot de passe",
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? CircularProgressIndicator()
//                         : Text("Se connecter"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String _username = "";

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final int userId = prefs.getInt("userId") ?? -1;

//     final response = await http.post(
//       Uri.parse("https://yakinci.com/misoa/mobile.php"),
//       body: {
//         "id": userId.toString(),
//       },
//     );

//     final data = jsonDecode(response.body);

//     setState(() {
//       _username = data["username"];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Accueil"),
//         ),
//         body: Center(
//           child: Text("Bonjour $_username"),
//         ),
//       ),
//     );
//   }
// }

