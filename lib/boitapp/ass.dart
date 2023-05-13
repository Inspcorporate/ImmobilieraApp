import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPge extends StatefulWidget {
  const HelpPge({super.key});

  @override
  State<HelpPge> createState() => _HelpPgeState();
}

class _HelpPgeState extends State<HelpPge> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage('images/sav.png'),
                height: 150,
                width: 150,
              ),
              ElevatedButton(
                onPressed: () async {
                  // launch('tel//$number');
                  // await FlutterPhoneDirectCaller.callNumber(number);
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: "+2250709171734",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('Le numero ne fonction plus');
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                child: const Icon(
                  Icons.phone,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                onPressed: () async {
                  final Uri smsLaunchUri = Uri(
                    scheme: 'sms',
                    path: "+2250709171734",
                  );
                  if (await canLaunchUrl(smsLaunchUri)) {
                    await launchUrl(smsLaunchUri);
                  } else {
                    print('Le numero ne fonction plus');
                  }
                },
                child: const Icon(
                  Icons.message,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: "admin&com@inspicorporate.com",
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  } else {
                    print('Le numero ne fonction plus');
                  }
                },
                child: const Icon(
                  Icons.email,
                  size: 40,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Image(
                image: AssetImage('images/notaire.png'),
                height: 200,
                width: 150,
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: "+2250709171734",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('le numero ne fonction plus');
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                child: const Icon(
                  Icons.phone,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                onPressed: () async {
                  final Uri smsLaunchUri = Uri(
                    scheme: 'sms',
                    path: "+2250709171734",
                  );
                  if (await canLaunchUrl(smsLaunchUri)) {
                    await launchUrl(smsLaunchUri);
                  } else {
                    print('le numero ne fonction plus');
                  }
                },
                child: const Icon(
                  Icons.message,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: "admin&com@inspicorporate.com",
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  } else {
                    print('le numero ne fonction plus');
                  }
                },
                child: const Icon(
                  Icons.email,
                  size: 40,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Image(
                image: AssetImage('images/ASSISTANT.png'),
                height: 150,
                width: 150,
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri(
                    scheme: 'tel',
                    path: "+2250709171734",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print('le numero ne fonction plus');
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                child: const Icon(
                  Icons.phone,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                onPressed: () async {
                  final Uri smsLaunchUri = Uri(
                    scheme: 'sms',
                    path: "+2250709171734",
                  );
                  if (await canLaunchUrl(smsLaunchUri)) {
                    await launchUrl(smsLaunchUri);
                  } else {
                    print('le numero ne fonction plus');
                  }
                },
                child: const Icon(
                  Icons.message,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 20, backgroundColor: Colors.transparent),
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: "admin&com@inspicorporate.com",
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  } else {
                    print('le numero ne fonction plus');
                  }
                },
                child: const Icon(
                  Icons.email,
                  size: 40,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
