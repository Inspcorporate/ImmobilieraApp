
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:misoa/boitapp/achat.dart';
import 'package:misoa/boitapp/search.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int _selectedItem = 0;
  int _selectedMode = 0;
  int _selectedColor = 0;

  void onLastSelection() async {
    if (_selectedItem == 0 || _selectedMode == 0 || _selectedColor == 0) {
      // Not all selections have been made, display an error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('echec de selection'),
            content: const Text('veillez un element dans chaque cas.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return; // Exit the function and don't continue to API call
    }
    String selectedItemString;
    switch (_selectedItem) {
      case 0:
        selectedItemString = "Relooking";
        break;
      case 1:
        selectedItemString = "location";
        break;
      case 2:
        selectedItemString = "achat";
        break;
      default:
        throw Exception('Invalid selected item');
    }

    String selectedModeString;
    switch (_selectedMode) {
      case 0:
        selectedModeString = "Appartements";
        break;
      case 1:
        selectedModeString = "Villas";
        break;
      case 2:
        selectedModeString = "Terrain";
        break;
      default:
        throw Exception('Invalid selected mode');
    }

    String selectedColorString;
    switch (_selectedColor) {
      case 0:
        selectedColorString = "Angre";
        break;
      case 1:
        selectedColorString = "Bingerville";
        break;
      case 2:
        selectedColorString = "Bassam";
        break;
      case 3:
        selectedColorString = "abobo";
        break;
      case 4:
        selectedColorString = "Yopougon";
        break;
      case 5:
        selectedColorString = "Paris";
        break;
      case 6:
        selectedColorString = "cocody";
        break;
      default:
        throw Exception('Invalid selected color');
    }

    try {
      final url =
          'https://s-p4.com/konan/misoa/bien.php?item=$selectedItemString&mode=$selectedModeString&color=$selectedColorString';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // The information has been successfully sent to your API
        // Process the results here and navigate to another page to display them
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MODIFER()),
        );
      } else {
        // The request failed to reach your API
        throw Exception('Failed to send selected items to API');
      }
    } catch (error) {
      // The request failed to reach your API
      // Display an error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content:
                const Text('Unable to connect to API. Please try again later.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.redAccent],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Image.network(
                "https://res.cloudinary.com/dgpmogg2w/image/upload/v1681736417/LOGO_INSP_DEF-12_uhbnni.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // Naviguer vers une autre page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text('Rechercher...'),
                  ],
                ),
              ),
            ),
            Text('Choix'),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedMode = 1; // update selected item
                              });
                            },
                            child: Row(children: [
                              Image(
                                image: const AssetImage('images/rel.png'),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Text(
                                'relooking',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: _selectedMode == 1
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  decoration: _selectedMode == 1
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationThickness: 5,
                                  decorationColor: Colors.red,
                                ),
                              )
                            ]),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedMode = 2; // update selected item
                              });
                            },
                            child: Row(children: [
                              Image(
                                image: const AssetImage('images/loc.png'),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Text(
                                'location',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: _selectedMode == 2
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  decoration: _selectedMode == 2
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationThickness: 5,
                                  decorationColor: Colors.red,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedMode = 3; // update selected item
                              });
                            },
                            child: Row(children: [
                              Image(
                                image: const AssetImage('images/ach.png'),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Text(
                                'achat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: _selectedMode == 3
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  decoration: _selectedMode == 3
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  decorationThickness: 5,
                                  decorationColor: Colors.red,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItem = 1;
                              });
                            },
                            child: Text(
                              'Appartements',
                              style: TextStyle(
                                fontSize: 20,
                                color: _selectedItem == 1
                                    ? const Color.fromARGB(255, 136, 136, 136)
                                    : Colors.black54,
                                fontWeight: _selectedItem == 1
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                decoration: _selectedItem == 1
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationThickness: 5,
                                decorationColor: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItem = 2;
                              });
                            },
                            child: Text(
                              'Villas',
                              style: TextStyle(
                                color: _selectedItem == 2
                                    ? const Color.fromARGB(255, 142, 142, 142)
                                    : Colors.black54,
                                fontSize: 20,
                                fontWeight: _selectedItem == 2
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                decoration: _selectedItem == 2
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationThickness: 5,
                                decorationColor: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItem = 3;
                              });
                            },
                            child: Text(
                              'Terrain',
                              style: TextStyle(
                                fontSize: 20,
                                color: _selectedItem == 3
                                    ? const Color.fromARGB(255, 83, 83, 82)
                                    : Colors.black54,
                                fontWeight: _selectedItem == 3
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                decoration: _selectedItem == 3
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationThickness: 5,
                                decorationColor: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    onLastSelection();
                                    _selectedColor = 1;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: _selectedColor == 1
                                        ? const Color.fromARGB(
                                            255, 245, 141, 134)
                                        : Colors.white,
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Angre',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: _selectedColor == 1
                                            ? Colors.white
                                            : Colors.black87,
                                        fontWeight: _selectedColor == 1
                                            ? FontWeight.w200
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    onLastSelection();
                                    _selectedColor = 2;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: _selectedColor == 2
                                        ? const Color.fromARGB(
                                            255, 255, 161, 154)
                                        : Colors.white,
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Bingerville',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: _selectedColor == 2
                                            ? Colors.white
                                            : Colors.black87,
                                        fontWeight: _selectedColor == 2
                                            ? FontWeight.w200
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    onLastSelection();
                                    _selectedColor = 3;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: _selectedColor == 3
                                        ? Colors.red
                                        : Colors.white,
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Bassam',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: _selectedColor == 3
                                            ? Colors.white
                                            : Colors.black87,
                                        fontWeight: _selectedColor == 3
                                            ? FontWeight.w200
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    onLastSelection();
                                    _selectedColor = 4;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: _selectedColor == 4
                                        ? const Color.fromARGB(
                                            255, 255, 160, 154)
                                        : Colors.white,
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'abobo',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: _selectedColor == 4
                                            ? Color.fromARGB(255, 0, 0, 0)
                                            : const Color.fromARGB(
                                                137, 0, 0, 0),
                                        fontWeight: _selectedColor == 4
                                            ? FontWeight.w200
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    onLastSelection();
                                    _selectedColor = 5;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: _selectedColor == 5
                                        ? const Color.fromARGB(
                                            255, 255, 172, 167)
                                        : Colors.white,
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Yopougon',
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    setState(() {
                                      onLastSelection();
                                      _selectedColor = 6;
                                    });
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: _selectedColor == 6
                                        ? const Color.fromARGB(
                                            255, 255, 135, 127)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(child: Text('cocody')),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
