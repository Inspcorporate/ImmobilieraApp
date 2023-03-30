import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:misoa/boitapp/visite.dart';

class Tour extends StatefulWidget {
  const Tour({super.key});

  @override
  State<Tour> createState() => _TourState();
}

class _TourState extends State<Tour> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FirstPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
