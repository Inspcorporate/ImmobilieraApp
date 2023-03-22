import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:misoa/identic/login.dart';

class forgetPage extends StatefulWidget {
  const forgetPage({super.key});

  @override
  State<forgetPage> createState() => _forgetPageState();
}

class _forgetPageState extends State<forgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("forget password"),
      ),
      body: _buildLoginForm(),
    );
  }
}

Widget _buildLoginForm() {
  TextEditingController email = TextEditingController();
  String thereponse = "";
  void clear() {
    email.clear();
  }

  Future loginuser() async {
    thereponse = "";
    final reponse = await http
        .post(Uri.parse("https://yakinci.com/misoa/login.php"), body: {
      "email": email.text,
    });
  }

  return Form(
    autovalidateMode: AutovalidateMode.always,
    child: Builder(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/blan.jpg'),
              fit: BoxFit.cover,
              opacity: 1.0,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const ClipRRect(
                child: Image(
                  image: AssetImage('images/mo.png'),
                  height: 200,
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 60,
                  child: TextField(
                    controller: email,
                    style: const TextStyle(
                        color: Colors.black,
                        textBaseline: TextBaseline.alphabetic),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                      ),
                      labelText: ("Email"),
                      hintText: "Saisir votre mail",
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 50),
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text(
                      "modifier le password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      CircularProgressIndicator;
                      if (email.text.isEmpty) {
                        print("email est vide");
                      } else {
                        loginuser();
                        clear();
                        circule();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

class circule extends StatelessWidget {
  const circule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
