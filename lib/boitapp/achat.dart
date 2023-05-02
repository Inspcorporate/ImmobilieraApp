import 'package:flutter/material.dart';
import 'package:misoa/boitapp/menu.dart';
import 'package:misoa/boitapp/profil.dart';
import 'package:misoa/boitapp/view.dart';

class MODIFER extends StatelessWidget {
  const MODIFER({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
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
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Achat de Bien",
              style: TextStyle(fontFamily: "devKC"),
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              child: SizedBox(height: 40, child: Container()),
            ),
            // Bloc Villa
            _buildBlock(
              title: "Villa",
              images: [
                // {
                //   "image":
                //       "https://lh3.googleusercontent.com/qgq-Kn3chOIxnFC6KPxBPdHr-emRWAwbAFIZGQtxu-37kbhjc2UQFzdmHz-4psU5sUKwyoNHaDvFDk34buhEyjCG1SspMso7NhvPDWrc",
                //   "description": "Belle villa avec piscine",
                //   "localisation": "Nice, France",
                //   "prix": "800 000 €",
                //   "status": "À vendre",
                // },
                {
                  "image":
                      "https://gandaimmobilier.com/wp-content/uploads/2022/03/villa-meublee-agla-80.jpg.webp",
                  "description": "Grande villa avec vue sur mer",
                  "localisation": "Cannes, France",
                  "prix": "1 200 000 €",
                  "status": "Achat",
                },
                {
                  "image":
                      "https://beninhouse.com/wp-content/uploads/2021/03/Emap-4.jpeg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Achat",
                },
                {
                  "image":
                      "https://immogroup.ahouefa.com/wp-content/uploads/2022/01/IMG-20220121-WA0024.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Achat",
                },
                {
                  "image":
                      "https://lanouvelletribune.info/wp-content/uploads/xwc.jpg",
                  "description": "Villa moderne avec jardin",
                  "localisation": "Marseille, France",
                  "prix": "900 000 €",
                  "status": "Achat",
                },
              ],
            ),

            // Bloc Appartement
            _buildBlock(
              title: "Appartement",
              images: [
                // {
                //   "image":
                //       "https://scontent.fabj3-2.fna.fbcdn.net/v/t39.30808-6/322877234_1799434137122651_7208144073106585363_n.jpg?stp=cp6_dst-jpg&_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=8hUPm3g86eQAX9oqhzo&_nc_ht=scontent.fabj3-2.fna&oh=00_AfBsKr9sKS7v3qopHUxCMUwWiJQR6cFXh_gZQbzD3eQ-ow&oe=641402B5",
                //   "description": "Beau duplex en centre-ville",
                //   "localisation": "Paris, France",
                //   "prix": "500 000 €",
                //   "status": "À vendre",
                // },
                // {
                //   "image":
                //       "https://lh3.googleusercontent.com/_MJRYooE6uW8tQbctotyaG-65JdqqtJSDR8LBiMIrTvy_sgoxz-LoZ92sdPbS6xLxbSt9LNh58Ve8LgFsAMNu__oXYF3L_pW5Mk_3MY",
                //   "description": "Appartement avec vue sur la Tour Eiffel",
                //   "localisation": "Paris, France",
                //   "prix": "1 000 000 €",
                //   "status": "À vendre",
                // },
                {
                  "image":
                      "https://www.capreit.ca/wp-content/uploads/2021/09/31-27.jpg",
                  "description": "Grand appartement lumineux",
                  "localisation": "Lyon, France",
                  "prix": "700 000 €",
                  "status": "À louer",
                },
                {
                  "image":
                      "https://media-cdn.tripadvisor.com/media/vr-splice-j/09/af/f7/f5.jpg ",
                  "description": "Grand appartement lumineux",
                  "localisation": "Lyon, France",
                  "prix": "700 000 €",
                  "status": "À louer",
                },
              ],
            ),

            // Bloc Résidence
            _buildBlock(title: "Résidence", images: [
              {
                "image":
                    "https://djeddi-immobilier.com/fr/wp-content/uploads/2022/01/1_Photo-11.jpg",
                "description": "Résidence de standing avec piscine",
                "localisation": "Cannes, France",
                "prix": "2 000 000 €",
                "status": "Achat",
              },
              {
                "image":
                    "https://repere.ci/wp-content/uploads/2022/07/294043735_1460355887711368_424813900704952524_n.jpg",
                "description": "Résidence sécurisée en bord de mer",
                "localisation": "Nice, France",
                "prix": "3 000 000 €",
                "status": "Achat",
              },
              {
                "image":
                    "https://tca.ci/wp-content/uploads/2020/10/5bs71svd41.jpg",
                "description": "Résidence de charme au coeur de la Provence",
                "localisation": "Aix-en-Provence, France",
                "prix": "2 700 000 £ ",
                "status": "Achat",
              },
              {
                "image":
                    "https://img.over-blog-kiwi.com/1/40/89/64/20190301/ob_9fce0e_img-20181030-wa0016.jpg",
                "description": "Résidence de charme au coeur de la Provence",
                "localisation": "Aix-en-Provence, France",
                "prix": "2 700 000 £ ",
                "status": "Achat",
              },
              {
                "image":
                    "https://www.yeminiservices.com/yemiservice/1642530058_b93d1fa6-ede2-464f-94d4-4074b084de83.jpg",
                "description": "Résidence de charme au coeur de la Provence",
                "localisation": "Aix-en-Provence, France",
                "prix": "2 700 000 £ ",
                "status": "Achat",
              },
            ]),
            // Bloc Terrain
            _buildBlock(
              title: "Terrain",
              images: [
                {
                  "image":
                      "https://www.expat.com/upload/housing/717976/1658839573614_3431392-full_size_3x2-t1658840525.jpg",
                  "description": "Terrain constructible en bord de mer",
                  "localisation": "Biarritz, France",
                  "prix": "500 000 €",
                  "status": "Achat",
                },
                {
                  "image":
                      "https://media.jumiadeals.com/ci_live/a1cbaac8d76196f7ce9791a.mobile-gallery-large.jpg",
                  "description": "Grand terrain pour projet immobilier",
                  "localisation": "Toulouse, France",
                  "prix": "1 500 000 €",
                  "status": "Achat",
                },
                {
                  "image":
                      "https://www.banabaana.com/upload/photos/2017/11/13/11/29/2y239od5v4.jpg",
                  "description": "Terrain agricole en pleine nature",
                  "localisation": "Dijon, France",
                  "prix": "300 000 €",
                  "status": "Achat",
                },
                {
                  "image":
                      "https://immobilier.pratik.ci/wp-content/uploads/2019/11/Anan-1-3-1200x683.jpg",
                  "description": "Terrain agricole en pleine nature",
                  "localisation": "Dijon, France",
                  "prix": "300 000 €",
                  "status": "Achat",
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
                                                
                                                  ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.red);

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
                                                // Text(images[index]["status"]!),
                                                // Padding(
                                                //   padding: const EdgeInsets.only(
                                                //       left: 100),
                                                //   child: ElevatedButton(
                                                //       style:
                                                //           ElevatedButton.styleFrom(
                                                //               backgroundColor:
                                                //                   Colors.red),
                                                //       onPressed: () async {
                                                //         if (await canLaunch(
                                                //             images[index]
                                                //                 ["image"]!)) {
                                                //           await launch(images[index]
                                                //               ["image"]!);
                                                //         } else {
                                                //           throw 'Could not launch ${images[index]["image"]!}';
                                                //         }
                                                //       },
                                                //       child: const Icon(
                                                //         Icons.visibility,
                                                //         color: Colors.black,
                                                //       )),
                                                // )
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
