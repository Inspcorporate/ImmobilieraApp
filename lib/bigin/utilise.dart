import 'package:flutter/material.dart';

class condiPage extends StatelessWidget {
  const condiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Condition D'utilisation"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Conditions d\'utilisation',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'En utilisant l\'application Misoa, vous acceptez les présentes conditions d\'utilisation. Veuillez les lire attentivement avant d\'utiliser l\'application. Si vous n\'êtes pas d\'accord avec ces conditions, vous ne devez pas utiliser l\'application.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontFamily: 'beroKC',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '1. Utilisation de l\'application',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Vous pouvez utiliser l\'application Misoa pour rechercher des biens immobiliers à vendre ou à louer. Vous ne pouvez pas utiliser l\'application à des fins illégales ou pour nuire à autrui.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontFamily: 'beroKC',
                ),
              ),
            ),
            SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '2. Informations sur les biens immobiliers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Les informations sur les biens immobiliers sont fournies par les annonceurs et ne sont pas vérifiées par Misoa. Nous ne pouvons pas garantir l\'exactitude ou l\'intégrité des informations fournies. Il est de votre responsabilité de vérifier ces informations avant de prendre une décision d\'achat ou de location.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  fontFamily: 'beroKC',
                ),
              ),
            ),
            SizedBox(height: 20),
            const Text(
              '3. Propriété intellectuelle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'Tous les droits de propriété intellectuelle relatifs à l\'application Misoa sont la propriété de Misoa ou de ses concédants de licence. Vous ne pouvez pas copier, modifier, distribuer ou utiliser l\'application ou son contenu à des fins commerciales sans notre autorisation écrite préalable.',
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
                fontFamily: 'beroKC',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Politique de confidentialité de Misoa",
              style: TextStyle(
                  fontFamily: 'beroKC', fontSize: 30, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Notre application immobilière(MISOA) respecte votre vie privée et la sécurité de vos données personnelles. Cette politique de confidentialité explique quelles informations sont collectées, comment elles sont utilisées et comment nous protégeons vos données personnelles.",
              style: TextStyle(
                fontFamily: 'beroKC',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                "Collecte d'informations",
                style: TextStyle(fontFamily: 'beroKC', fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                  "Nous collectons les informations que vous nous fournissez lorsque vous utilisez notre application, telles que votre nom, votre adresse e-mail, votre numéro de téléphone, votre adresse, votre budget et vos préférences de recherche. Nous collectons également des informations sur l'utilisation de notre application, telles que les pages visitées et les recherches effectuées.",
                  style: TextStyle(
                    fontFamily: 'beroKC',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                "Utilisation des informations",
                style: TextStyle(fontFamily: 'beroKC', fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                  "Nous utilisons les informations que nous collectons pour vous fournir des services immobiliers personnalisés, tels que des annonces de propriétés qui correspondent à vos critères de recherche. Nous pouvons également utiliser vos informations pour vous contacter à propos de nouvelles propriétés ou d'autres informations pertinentes pour vous.",
                  style: TextStyle(
                    fontFamily: 'beroKC',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                "Protection des données",
                style: TextStyle(fontFamily: 'beroKC', fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                  "Nous prenons des mesures de sécurité raisonnables pour protéger vos informations personnelles contre tout accès non autorisé, toute utilisation ou divulgation. Nous utilisons des protocoles de sécurité standard tels que SSL pour protéger les informations transmises sur notre application.",
                  style: TextStyle(
                    fontFamily: 'beroKC',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                "Partage d'informations",
                style: TextStyle(fontFamily: 'beroKC', fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                  "Nous ne vendons pas et ne partageons pas vos informations personnelles avec des tiers, sauf dans les cas suivants :Si nous avons votre consentement explicite pour partager vos informations.Si nous sommes tenus de divulguer vos informations en vertu d'une loi, d'un règlement ou d'une ordonnance judiciaire.Si nous sommes obligés de partager vos informations pour protéger nos droits, notre propriété ou la sécurité de nos utilisateurs.",
                  style: TextStyle(
                    fontFamily: 'beroKC',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                "Contact",
                style: TextStyle(fontFamily: 'beroKC', fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                  "Si vous avez des questions ou des préoccupations concernant notre politique de confidentialité ou notre traitement de vos informations personnelles, veuillez nous contacter à l'adresse e-mail suivante : admin&com@inspcorporate.com.",
                  style: TextStyle(
                    fontFamily: 'beroKC',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
