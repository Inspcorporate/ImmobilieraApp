import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class ActulitiPage extends StatefulWidget {
  const ActulitiPage({super.key});

  @override
  State<ActulitiPage> createState() => _ActulitiPageState();
}

class _ActulitiPageState extends State<ActulitiPage> {
  int _currentIndex = 0;
  final List<String> _imagesList = [
    'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
    'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
    'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
  ];
  final List<String> _namesList = [
    'Image ',
    'Image ',
    'Image',
  ];

  final List<String> _locationsList = [
    'Location 1',
    'Location 2',
    'Location 3',
  ];

  final List<String> _pricesList = [
    '\$100',
    '\$200',
    '\$300',
  ];

  final List<Map<String, dynamic>> itemList = [
    {
      'image':
          'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
      'description': 'Description 1',
      'localisation': 'Localisation 1',
      'prix': 10.99,
    },
    {
      'image':
          'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
      'description': 'Description 2',
      'localisation': 'Localisation 2',
      'prix': 20.99,
    },
    {
      'image':
          'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
      'description': 'Description 3',
      'localisation': 'Localisation 3',
      'prix': 30.99,
    },
    {
      'image':
          'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
      'description': 'Description 4',
      'localisation': 'Localisation 4',
      'prix': 40.99,
    },
    {
      'image':
          'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
      'description': 'Description 5',
      'localisation': 'Localisation 5',
      'prix': 50.99,
    },
    {
      'image':
          'https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg',
      'description': 'Description 6',
      'localisation': 'Localisation 6',
      'prix': 60.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                                SizedBox(width: 5.0),
                                Text(
                                  price,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
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
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['description'],
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4.0),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on, size: 16.0),
                                          SizedBox(width: 4.0),
                                          Text(item['localisation']),
                                        ],
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        '\$${item['prix']}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
      ),
    );
  }
}
