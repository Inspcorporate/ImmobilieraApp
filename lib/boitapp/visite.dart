import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

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
        image: "https://beninhouse.com/wp-content/uploads/2021/03/Emap-4.jpeg",
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

  @override
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
        body: Column(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                          Text(product.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'beroKC')),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Image.network(
                                  product.image,
                                  width: 400,
                                  height: 500,
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
                                      Text(
                                        product.description,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        product.location,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${product.price.toStringAsFixed(2)}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            product.status,
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
