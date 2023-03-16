import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misoa/boitapp/achat.dart';
import 'package:misoa/boitapp/action/Relooking.dart';
import 'package:misoa/boitapp/action/loaction.dart';
import 'package:misoa/boitapp/action/vente.dart';

class dashboad extends StatefulWidget {
  const dashboad({super.key});

  @override
  State<dashboad> createState() => _dashboadState();
}

class _dashboadState extends State<dashboad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/blan.jpg'),
              fit: BoxFit.cover,
              opacity: 1.0,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Empty space

                const SizedBox(height: 170), // Empty space
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const wainting1(),
                              ),
                            );
                          },
                          child: const Image(
                              image: AssetImage('images/rel.png'),
                              height: 200,
                              width: 200),
                        ),
                        SizedBox(height: 10), // Empty space
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const wainting2(),
                              ),
                            );
                          },
                          child: const Image(
                              image: AssetImage('images/ven.png'),
                              height: 200,
                              width: 200),
                        ), // Icon color
                        // Icon size

                        const SizedBox(height: 10), // Empty space
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const waiting(),
                              ),
                            );
                          },
                          child: const Image(
                              image: AssetImage('images/loc.png'),
                              height: 200,
                              width: 200),
                        ),
                        const SizedBox(height: 10), // Empty space
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const waitingPage(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('images/ach.png'),
                            height: 200,
                            width: 200,
                          ),
                        ),
                        const SizedBox(height: 10), // Empty space
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class waitingPage extends StatefulWidget {
  const waitingPage({super.key});

  @override
  State<waitingPage> createState() => _waitingPageState();
}

class _waitingPageState extends State<waitingPage> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MODIFER(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class waiting extends StatefulWidget {
  const waiting({super.key});

  @override
  State<waiting> createState() => _waitingState();
}

class _waitingState extends State<waiting> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Relooking(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class wainting1 extends StatefulWidget {
  const wainting1({super.key});

  @override
  State<wainting1> createState() => _wainting1State();
}

class _wainting1State extends State<wainting1> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Vendre(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class wainting2 extends StatefulWidget {
  const wainting2({super.key});

  @override
  State<wainting2> createState() => _wainting2State();
}

class _wainting2State extends State<wainting2> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Location(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
