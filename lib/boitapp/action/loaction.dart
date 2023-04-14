import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/boitapp/profil.dart';
import 'package:misoa/boitapp/view.dart';

class Locatio extends StatefulWidget {
  const Locatio({super.key});

  @override
  State<Locatio> createState() => _LocatioState();
}

class _LocatioState extends State<Locatio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/blan.jpg'),
                  fit: BoxFit.cover,
                  opacity: 1.0,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 420,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bkgr.jpg'),
                        fit: BoxFit.cover,
                        opacity: 1.0,
                        repeat: ImageRepeat.noRepeat,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Menu(),
                                  ));
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50, top: 20),
                          child: Text(
                            'Location de Bien',
                            style: TextStyle(
                              fontFamily: 'beroKC',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: SizedBox(height: 20, child: Container()),
            ),
            _buildBlock(
              title: "Villa",
              images: [
                {
                  "image":
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700810/4_ipbyxy.png",
                  "description": "Belle villa avec piscine",
                  "localisation": "Nice, France",
                  "prix": "800 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680697182/1_tqqgp6.png",
                  "description": "Grande villa avec vue sur mer",
                  "localisation": "Cannes, France",
                  "prix": "1 200 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700666/2_e1qage.png",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://immogroup.ahouefa.com/wp-content/uploads/2022/01/IMG-20220121-WA0024.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://lanouvelletribune.info/wp-content/uploads/xwc.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
              ],
            ),
            _buildBlock(
              title: "Appartement",
              images: [
                {
                  "image":
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700811/5_xsd2r2.png",
                  "description": "Belle villa avec piscine",
                  "localisation": "Nice, France",
                  "prix": "800 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1680700766/3_vinovt.png",
                  "description": "Grande villa avec vue sur mer",
                  "localisation": "Cannes, France",
                  "prix": "1 200 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://beninhouse.com/wp-content/uploads/2021/03/Emap-4.jpeg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://immogroup.ahouefa.com/wp-content/uploads/2022/01/IMG-20220121-WA0024.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://lanouvelletribune.info/wp-content/uploads/xwc.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
              ],
            ),
            _buildBlock(
              title: "AUTRES",
              images: [
                {
                  "image":
                      "https://res.cloudinary.com/dgpmogg2w/image/upload/v1681203917/WhatsApp_Image_2023-04-10_%C3%A0_14.14.01_gdsnco.jpg",
                  "description": "Belle villa avec piscine",
                  "localisation": "Nice, France",
                  "prix": "800 000 €",
                  "status": "À vendre",
                },
                {
                  "image":
                      "https://gandaimmobilier.com/wp-content/uploads/2022/03/villa-meublee-agla-80.jpg.webp",
                  "description": "Grande villa avec vue sur mer",
                  "localisation": "Cannes, France",
                  "prix": "1 200 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://beninhouse.com/wp-content/uploads/2021/03/Emap-4.jpeg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://immogroup.ahouefa.com/wp-content/uploads/2022/01/IMG-20220121-WA0024.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
                {
                  "image":
                      "https://lanouvelletribune.info/wp-content/uploads/xwc.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Location",
                },
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlock(
      {required String title, required List<Map<String, String>> images}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 130),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 360,
          width: 500,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(children: [
                          InkWell(
                            child: Image.network(
                              images[index]["image"]!,
                              fit: BoxFit.cover,
                              height: 340,
                              width: 320,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImage(
                                      imageUrl: images[index]["image"]!,
                                      descri: images[index]["description"]!,
                                      loca: images[index]["localisation"]!,
                                      prix: images[index]["prix"]!,
                                      status: images[index]["status"]!),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 20.0,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.lightBlue),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => FullScreenImage(
                                                              imageUrl: images[
                                                                      index]
                                                                  ["image"]!,
                                                              descri: images[index][
                                                                  "description"]!,
                                                              loca: images[index]
                                                                  [
                                                                  "localisation"]!,
                                                              prix:
                                                                  images[index]
                                                                      ["prix"]!,
                                                              status: images[
                                                                      index]
                                                                  ["status"]!)));
                                                },
                                                child: const Text('Detail')),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red),
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Location(
                                                          descri: images[index]
                                                              ["description"]!,
                                                          loca: images[index]
                                                              ["localisation"]!,
                                                          prix: images[index]
                                                              ["prix"]!,
                                                          status: images[index]
                                                              ["status"]!),
                                                    ),
                                                  );
                                                },
                                                child: const Text('Je veux'))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Icon(Icons.star_half,
                                                    color: Colors.yellow),
                                                Icon(
                                                  Icons.star_border_outlined,
                                                  color: Colors.yellow,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                    images[index]
                                                        ["localisation"]!,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
