import 'package:flutter/material.dart';

import '../models/balancedtext.dart';

void main() {
  runApp(const AboutUs());
}

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
                    'Developed by', //Regular Text
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb98068),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Terasak Treepak 6252410017',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                    SizedBox(height: 16),
                  Text(
                    'Apisit     Kulkham \n6252410001',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  //Divider(height: 32),
               
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
