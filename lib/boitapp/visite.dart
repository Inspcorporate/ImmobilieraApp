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

  const Product({
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
  final List<Product> products = [
    const Product(
        name: "Appartement",
        image:
            "https://repere.ci/wp-content/uploads/2022/07/294043735_1460355887711368_424813900704952524_n.jpg",
        description: "Description for Product 1",
        location: "Location for Product 1",
        price: 19.99,
        status: "vendu"),
    const Product(
        name: "residence",
        image:
            "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png",
        description: "Description for Product 2",
        location: "Location for Product 2",
        price: 29.99,
        status: "projet"),
    const Product(
        name: "Terrain",
        image:
            "https://repere.ci/wp-content/uploads/2022/07/294043735_1460355887711368_424813900704952524_n.jpg",
        description: "Description for Product 2",
        location: "Location for Product 2",
        price: 29.99,
        status: "disponible"),
    const Product(
        name: "villa",
        image:
            "https://repere.ci/wp-content/uploads/2022/07/294043735_1460355887711368_424813900704952524_n.jpg",
        description: "Description for Product 3",
        location: "Location for Product 3",
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
                  labelText: "Rechercher un bien immobilier",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
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
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'beroKC'),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImage(
                                      imageUrl: product.image,
                                      descri: product.description,
                                      loca: product.location,
                                      prix: product.price.toString(),
                                      status: product.status),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Image.network(
                                    product.image,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 20.0,
                                    left: 20.0,
                                    right: 20.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${product.price.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              product.status,
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.redAccent,
                                                ),
                                                onPressed: () {},
                                                child: const Text('Autres'))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
