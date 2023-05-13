import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ActulitiPage extends StatefulWidget {
  const ActulitiPage({super.key});

  @override
  State<ActulitiPage> createState() => _ActulitiPageState();
}

class _ActulitiPageState extends State<ActulitiPage> {
  int _currentIndex = 0;
  final List<String> _imagesList = [
    'https://res.cloudinary.com/degicbg12/image/upload/v1680107686/app_erg023.jpg',
    'https://res.cloudinary.com/degicbg12/image/upload/v1680108152/viila_unzt86.jpg',
    'https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png',
  ];
  final List<String> _namesList = [
    'Appartement 3pieèces',
    'Villa Basse 5pièces  ',
    'residense meublée',
  ];

  final List<String> _locationsList = [
    'Bassam',
    'Rivera Faya,Cocody',
    'Bassam',
  ];

  final List<String> _pricesList = [
    '\ XOF3000000',
    '\ XOF3000000',
    '\ XOF3000000',
  ];

  final List<Map<String, dynamic>> itemList = [
    {
      'image':
          'https://res.cloudinary.com/degicbg12/image/upload/v1680107686/app_erg023.jpg',
      'description': 'Villa Basse 5pièces ',
      'localisation': 'Rivera Faya,Cocody',
      'prix': 3000000,
    },
    {
      'image':
          'https://res.cloudinary.com/degicbg12/image/upload/v1680107686/app_erg023.jpg',
      'description': 'Description 2',
      'localisation': 'Localisation 2',
      'prix': 20.99,
    },
    {
      'image':
          'https://res.cloudinary.com/dgpmogg2w/image/upload/v1680697182/1_tqqgp6.png',
      'description': 'Description 3',
      'localisation': 'Localisation 3',
      'prix': 30.99,
    },
    {
      'image':
          'https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png',
      'description': 'Description 4',
      'localisation': 'Localisation 4',
      'prix': 40.99,
    },
    {
      'image':
          'https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700810/4_ipbyxy.png',
      'description': 'Description 5',
      'localisation': 'Localisation 5',
      'prix': 50.99,
    },
    {
      'image':
          'https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png',
      'description': 'Description 6',
      'localisation': 'Localisation 6',
      'prix': 60.99,
    },
  ];

  bool _isConnected = true; // assume there's an internet connection at first

  @override
  void initState() {
    super.initState();
    _checkInternetConnectivity();
  }

  Future<void> _checkInternetConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() => _isConnected = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isConnected) {
      return const Center(
        child: Text('No internet connection.'),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: _imagesList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final url = _imagesList[index];
                final name = _namesList[index];
                final location = _locationsList[index];
                final price = _pricesList[index];
                return Stack(
                  children: [
                    Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 20.0,
                      left: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 16.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                price,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            price,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _imagesList.map((url) {
                int index = _imagesList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            SingleChildScrollView(
              child: Column(
                children: itemList
                    .map((item) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                item['image'],
                                height: 100,
                                width: 150,
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['description'],
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on, size: 16.0),
                                          const SizedBox(width: 4.0),
                                          Text(item['localisation']),
                                        ],
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        '\$${item['prix']}',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
