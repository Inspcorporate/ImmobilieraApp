import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                              const Text(
                                ' KONAN KOUDIO',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              InkWell(
                                child: Icon(Icons.edit),
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
                              const Text(
                                'tel: 22507562219783',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              InkWell(
                                child: Icon(Icons.edit),
                                onTap: () {},
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Text(
                                'kasseberangerkonan@gmail.com',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: Icon(Icons.edit),
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
                      : SingleChildScrollView(
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
                                        backgroundColor: Colors.transparent),
                                    child: const Icon(
                                      Icons.phone,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 20,
                                        backgroundColor: Colors.transparent),
                                    onPressed: () async {
                                      final Uri smsLaunchUri = Uri(
                                        scheme: 'sms',
                                        path: "+2250709171734",
                                      );
                                      if (await canLaunchUrl(smsLaunchUri)) {
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
                                        backgroundColor: Colors.transparent),
                                    onPressed: () async {
                                      final Uri emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                        path: "admin&com@inspicorporate.com",
                                      );
                                      if (await canLaunchUrl(emailLaunchUri)) {
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
                                        backgroundColor: Colors.transparent),
                                    child: const Icon(
                                      Icons.phone,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 20,
                                        backgroundColor: Colors.transparent),
                                    onPressed: () async {
                                      final Uri smsLaunchUri = Uri(
                                        scheme: 'sms',
                                        path: "+2250709171734",
                                      );
                                      if (await canLaunchUrl(smsLaunchUri)) {
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
                                        backgroundColor: Colors.transparent),
                                    onPressed: () async {
                                      final Uri emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                        path: "admin&com@inspicorporate.com",
                                      );
                                      if (await canLaunchUrl(emailLaunchUri)) {
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
                                    image: AssetImage('images/ASSISTANT.png'),
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
                                        backgroundColor: Colors.transparent),
                                    child: const Icon(
                                      Icons.phone,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 20,
                                        backgroundColor: Colors.transparent),
                                    onPressed: () async {
                                      final Uri smsLaunchUri = Uri(
                                        scheme: 'sms',
                                        path: "+2250709171734",
                                      );
                                      if (await canLaunchUrl(smsLaunchUri)) {
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
                                        backgroundColor: Colors.transparent),
                                    onPressed: () async {
                                      final Uri emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                        path: "admin&com@inspicorporate.com",
                                      );
                                      if (await canLaunchUrl(emailLaunchUri)) {
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
                        )),
        ],
      ),
    );
  }
}
