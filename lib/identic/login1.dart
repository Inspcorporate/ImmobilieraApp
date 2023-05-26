import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectPge extends StatefulWidget {
  const ConnectPge({super.key});

  @override
  State<ConnectPge> createState() => _ConnectPgeState();
}

class _ConnectPgeState extends State<ConnectPge> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return FutureBuilder<bool>(
      future: checkConnection(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Connexion'),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: hauteur,
                  width: largeur,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/user.jpg'),
                      fit: BoxFit.cover,
                      opacity: 1.0,
                      repeat: ImageRepeat.noRepeat,
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: hauteur * 0.1,
                    ),
                    const Text(
                      'MISOA',
                      style: TextStyle(
                          fontFamily: 'beroKC',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://res.cloudinary.com/dgpmogg2w/image/upload/v1683569192/vrai_vsctog.png'),
                      radius: 70,
                    ),
                    SizedBox(
                      height: hauteur * 0.1,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: FormBuilder(
                              key: _formKey,
                              child:Column(
                                children: [
                                  
                                ],
                              )
                              
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
        } else {
          // L'utilisateur n'est pas connecté, rediriger vers la page de connexion
          return const Menu();
        }
      },
    );
  }

  Future<bool> checkConnection() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isConnected = prefs.getBool('isConnected') ?? true;
    return isConnected;
  }
}
