import 'package:flutter/material.dart';

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
            "https://lh3.googleusercontent.com/qgq-Kn3chOIxnFC6KPxBPdHr-emRWAwbAFIZGQtxu-37kbhjc2UQFzdmHz-4psU5sUKwyoNHaDvFDk34buhEyjCG1SspMso7NhvPDWrc",
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
            "https://scontent.fabj3-2.fna.fbcdn.net/v/t39.30808-6/322877234_1799434137122651_7208144073106585363_n.jpg?stp=cp6_dst-jpg&_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=8hUPm3g86eQAX9oqhzo&_nc_ht=scontent.fabj3-2.fna&oh=00_AfBsKr9sKS7v3qopHUxCMUwWiJQR6cFXh_gZQbzD3eQ-ow&oe=641402B5",
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
            body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                filterProducts(query);
              },
              decoration: const InputDecoration(
                labelText: "Rechercher un bien immobilier",
                border: OutlineInputBorder(),
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
                          child: Image.network(
                            product.image,
                            width: 400,
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(product.description,
                            style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 5),
                        Text(product.location, style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        Text(
                          "${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          product.status,
                          style: const TextStyle(color: Colors.green),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Autres'))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ])));
  }
}
