import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  final String imageUrl;
  final String descri;
  final String loca;
  final String prix;
  final String status;
  const FullScreenImage(
      {required this.imageUrl,
      required this.descri,
      required this.loca,
      required this.prix,
      required this.status});

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  // bool _isConnected = true; // initial connectivity status

  // Future<void> checkConnectivity() async {
  //   final ConnectivityResult connectivityResult =
  //       await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.none) {
  //     setState(() {
  //       _isConnected = false;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   checkConnectivity(); // check connectivity on page initialization
  // }

  @override
  Widget build(BuildContext context) {
    // Check if there is no internet connection and show an error widget
    // if (!_isConnected) {
    //   return Scaffold(
    //     body: Center(
    //       child: Text('Erreur 404: Aucune connexion internet'),
    //     ),
    //   );
    // }

    // If there is an internet connection, show the page content
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                height: 400,
                width: 400,
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Description'),
                subtitle: Text(widget.descri),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Localisation'),
                subtitle: Text(widget.loca),
              ),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Prix'),
                subtitle: Text(widget.prix),
              ),
              ListTile(
                leading: Icon(Icons.leave_bags_at_home),
                title: const Text('status'),
                subtitle: Text(widget.status),
              ),
              ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('ACHETER'),
                    onPressed: () {/* ... */},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
