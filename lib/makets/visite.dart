import 'package:flutter/material.dart';

class VisitePage extends StatefulWidget {
  const VisitePage({Key? key}) : super(key: key);

  @override
  State<VisitePage> createState() => _VisitePageState();
}

class _VisitePageState extends State<VisitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: ListView(
        children: [
          Row(
            children: [
              const Text(
                'NOM & PRENOM: KONAN KOUDIO',
                style: TextStyle(
                    color: Colors.black12, fontFamily: 'beroKC', fontSize: 20),
              ),
              const SizedBox(
                width: 100,
              ),
              InkWell(
                child: Icon(Icons.edit),
                onTap: () {},
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'tel: 22507562219783',
                style: TextStyle(
                    color: Colors.black12, fontFamily: 'beroKC', fontSize: 20),
              ),
              SizedBox(
                width: 100,
              ),
              InkWell(
                child: Icon(Icons.edit),
                onTap: () {},
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'email:kasseberangerkonan@gmail.com',
                style: TextStyle(
                    color: Colors.black12, fontFamily: 'beroKC', fontSize: 20),
              ),
              SizedBox(
                width: 100,
              ),
              InkWell(
                child: Icon(Icons.edit),
                onTap: () {},
              )
            ],
          )
        ],
      )),
    );
  }
}
