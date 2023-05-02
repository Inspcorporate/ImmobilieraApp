
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  final String imageUrl;
  final String descri;
  final String loca;
  final String prix;
  final String status;
  const FullScreenImage(
      {super.key, required this.imageUrl,
      required this.descri,
      required this.loca,
      required this.prix,
      required this.status});

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {

  bool _isInterested = false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
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
                  leading: const Icon(Icons.description),
                  title: const Text('Description'),
                  subtitle: Text(widget.descri),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Localisation'),
                  subtitle: Text(widget.loca),
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Prix'),
                  subtitle: Text(widget.prix),
                ),
                ListTile(
                  leading: const Icon(Icons.leave_bags_at_home),
                  title: const Text('status'),
                  subtitle: Text(widget.status),
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isInterested = true;
                        });
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Intéressé'),
                              content: const Text(
                                  'Vous êtes maintenant intéressé !'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isInterested ? Colors.green : Colors.red,
                      ),
                      child: Text(_isInterested ? 'Intéressé !' : 'Intéresser'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
