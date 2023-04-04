import 'package:flutter/material.dart';
import 'package:misoa/boitapp/admin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username = "";
  String prenom = "";
  String numero = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userId = prefs.getInt("userId") ?? -1;

    final response = await http.post(
      Uri.parse("https://yakinci.com/misoa/mobile.php"),
      body: {
        "id": userId.toString(),
      },
    );

    final data = jsonDecode(response.body);

  setState(() {
    _username = data["username"] ?? '';
    prenom = data["prenom"] ?? '';
    numero = data["numero"] ?? '';
    email = data["email"] ?? '';
  });
  }

  void disconnectUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const waiting()),
    );
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/p.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '$prenom',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(horizontal: 30),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.person,
                        color: _selectedIndex == 0 ? Colors.red : Colors.grey),
                    Text('Profile',
                        style: TextStyle(
                            color:
                                _selectedIndex == 0 ? Colors.red : Colors.grey))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.explore,
                        color: _selectedIndex == 1 ? Colors.red : Colors.grey),
                    Text('Explore',
                        style: TextStyle(
                            color:
                                _selectedIndex == 1 ? Colors.red : Colors.grey))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.help_center,
                        color: _selectedIndex == 2 ? Colors.red : Colors.grey),
                    Text('Assisance',
                        style: TextStyle(
                            color:
                                _selectedIndex == 2 ? Colors.red : Colors.grey))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  disconnectUser(context);
                },
                child: Column(
                  children: [
                    Icon(Icons.logout,
                        color: _selectedIndex == 3 ? Colors.red : Colors.grey),
                    Text('logout',
                        style: TextStyle(
                            color:
                                _selectedIndex == 3 ? Colors.red : Colors.grey))
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: _selectedIndex == 0
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                ' Mr $_username',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              InkWell(
                                child: const Icon(Icons.edit),
                                onTap: () {},
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'tel: 225 $numero',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              InkWell(
                                child: const Icon(Icons.edit),
                                onTap: () {},
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                '$email',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: const Icon(Icons.edit),
                                onTap: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : _selectedIndex == 1
                      ? Row(
                          children: const [
                            Text(
                              ' aucun interêt',
                              style: TextStyle(
                                  color: Colors.black12, fontSize: 20),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                          ],
                        )
                      : _selectedIndex == 2
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        image: AssetImage('images/sav.png'),
                                        height: 150,
                                        width: 150,
                                      ),
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
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        child: const Icon(
                                          Icons.phone,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        onPressed: () async {
                                          final Uri smsLaunchUri = Uri(
                                            scheme: 'sms',
                                            path: "+2250709171734",
                                          );
                                          if (await canLaunchUrl(
                                              smsLaunchUri)) {
                                            await launchUrl(smsLaunchUri);
                                          } else {
                                            print('Le numero ne fonction plus');
                                          }
                                        },
                                        child: const Icon(
                                          Icons.message,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        onPressed: () async {
                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path:
                                                "admin&com@inspicorporate.com",
                                          );
                                          if (await canLaunchUrl(
                                              emailLaunchUri)) {
                                            await launchUrl(emailLaunchUri);
                                          } else {
                                            print('Le numero ne fonction plus');
                                          }
                                        },
                                        child: const Icon(
                                          Icons.email,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Image(
                                        image: AssetImage('images/notaire.png'),
                                        height: 200,
                                        width: 150,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final Uri url = Uri(
                                            scheme: 'tel',
                                            path: "+2250709171734",
                                          );
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            print('le numero ne fonction plus');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        child: const Icon(
                                          Icons.phone,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        onPressed: () async {
                                          final Uri smsLaunchUri = Uri(
                                            scheme: 'sms',
                                            path: "+2250709171734",
                                          );
                                          if (await canLaunchUrl(
                                              smsLaunchUri)) {
                                            await launchUrl(smsLaunchUri);
                                          } else {
                                            print('le numero ne fonction plus');
                                          }
                                        },
                                        child: const Icon(
                                          Icons.message,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        onPressed: () async {
                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path:
                                                "admin&com@inspicorporate.com",
                                          );
                                          if (await canLaunchUrl(
                                              emailLaunchUri)) {
                                            await launchUrl(emailLaunchUri);
                                          } else {
                                            print('le numero ne fonction plus');
                                          }
                                        },
                                        child: const Icon(
                                          Icons.email,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Image(
                                        image:
                                            AssetImage('images/ASSISTANT.png'),
                                        height: 150,
                                        width: 150,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final Uri url = Uri(
                                            scheme: 'tel',
                                            path: "+2250709171734",
                                          );
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            print('le numero ne fonction plus');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        child: const Icon(
                                          Icons.phone,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        onPressed: () async {
                                          final Uri smsLaunchUri = Uri(
                                            scheme: 'sms',
                                            path: "+2250709171734",
                                          );
                                          if (await canLaunchUrl(
                                              smsLaunchUri)) {
                                            await launchUrl(smsLaunchUri);
                                          } else {
                                            print('le numero ne fonction plus');
                                          }
                                        },
                                        child: const Icon(
                                          Icons.message,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 20,
                                            backgroundColor:
                                                Colors.transparent),
                                        onPressed: () async {
                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path:
                                                "admin&com@inspicorporate.com",
                                          );
                                          if (await canLaunchUrl(
                                              emailLaunchUri)) {
                                            await launchUrl(emailLaunchUri);
                                          } else {
                                            print('le numero ne fonction plus');
                                          }
                                        },
                                        child: const Icon(
                                          Icons.email,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Row()),
        ],
      ),
    );
  }
}
