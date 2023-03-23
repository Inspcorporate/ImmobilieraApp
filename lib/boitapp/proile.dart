import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Widget> _widgetsList = [
    Container(
      child: Row(
        children: const [
          Text('Konan TESTEUR'),
          SizedBox(
            width: 200,
          ),
          InkWell(
            child: Icon(Icons.edit),
          )
        ],
      ),
    ),
    Container(
      child: const Text('Contenu du deuxième widget'),
    ),
  ];
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
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: EdgeInsets.symmetric(horizontal: 30),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (_selectedIndex != 0) {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Personnelle',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_selectedIndex != 1) {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Interêt',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: [_widgetsList[_selectedIndex]],
            ),
          ),
        ],
      ),
    );
  }
}
