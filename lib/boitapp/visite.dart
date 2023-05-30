import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:misoa/boitapp/view.dart';

class Product {
  final String name;
  final String image;
  final String description;
  final String location;
  final double price;
  final String status;

  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.price,
    required this.status,
  });
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<bool> change = [false, false, false, false];
  final List<Product> products = [
    Product(
        name: "Appartement",
        image:
            "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png",
        description: "Description for Product 1",
        location: "Abidjan, Côte d'Ivoire",
        price: 19.99,
        status: "vendu"),
    Product(
        name: "residence",
        image:
            "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png",
        description: "Description for Product 2",
        location: "Bouaké ,Côte d'ivoire",
        price: 29.99,
        status: "projet"),
    Product(
        name: "Terrain",
        image:
            "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png",
        description: "Description for Product 2",
        location: "Yamoussoukro,Côte d'ivoire",
        price: 29.99,
        status: "disponible"),
    Product(
        name: "villa",
        image:
            "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png",
        description: "Description for Product 3",
        location: "San pedro,Côte d'ivoire",
        price: 39.99,
        status: "projet"),
  ];

  List<Product> filteredProducts = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterProducts(String query) {
    List<Product> tempProducts = [];
    products.forEach((product) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        tempProducts.add(product);
      }
    });
    setState(() {
      filteredProducts = tempProducts;
    });
  }

  bool _isConnected = true; // assume there's an internet connection at first

  void intState() {
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  filterProducts(query);
                },
                decoration: InputDecoration(
                  labelText: "Rechercher.... ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width,
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        product.image,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        bottom: 10.0,
                                        left: 10.0,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.red,
                                              ),
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            FullScreenImage(
                                                                imageUrl:
                                                                    product
                                                                        .image,
                                                                descri: product
                                                                    .description,
                                                                loca: product
                                                                    .location,
                                                                prix: product
                                                                    .price
                                                                    .toString(),
                                                                status: product
                                                                    .status),
                                                      ),
                                                    );
                                                  },
                                                  child: const Text('Detail')),
                                            ),
                                            const SizedBox(height: 10.0),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  change[index] =
                                                      !change[index];
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                side:
                                                    const BorderSide(width: 1),
                                                backgroundColor: !change[index]
                                                    ? const Color.fromARGB(
                                                        34, 130, 130, 130)
                                                    : const Color.fromARGB(
                                                        255, 1, 255, 26),
                                              ),
                                              child: Text(!change[index]
                                                  ? 'Intéresser'
                                                  : 'Intéressé !'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        const Text('A partir de'),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          product.price.toStringAsFixed(2),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        const Text('FCFA'),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(width: 5.0),
                                            Text(
                                              product.location,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.bed_rounded),
                                                      Text('4')
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons
                                                          .shower_outlined),
                                                      Text('2')
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.car_rental),
                                                      Text('2')
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
