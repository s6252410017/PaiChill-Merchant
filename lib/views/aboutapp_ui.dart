import 'package:flutter/material.dart';

import '../models/balancedtext.dart';

void main() {
  runApp(const AboutApp());
}

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),

      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffb98068)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "About App",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffb98068)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: SizedBox(
              width: 256,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'PaiChill Merchant', //Regular Text
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb98068),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Paichill Merchant apps can be manage, administrate, and view shop data.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(height: 32),
                  // Text(
                  //   'Balanced Text',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                  // BalancedText('The quick brown fox jumps over the lazy dog'),
                   Text(
                    'THESIS', //Regular Text
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb98068),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'This application constitutes part of the thesis.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
