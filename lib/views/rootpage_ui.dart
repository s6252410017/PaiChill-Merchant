import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_paicill_app/views/setting_ui.dart';

import 'accountpage_ui.dart';
import 'homemenu_ui.dart';


class RootPageUI extends StatefulWidget {
  String name = '';
  //String sex = '';
 // String birthdate = '';
  String email = '';
  String password = '';
  String image = '';
 // List favorite = [];
  //String promotion = '';

  RootPageUI({
    Key? key,
    required this.name,
   // required this.sex,
   // required this.birthdate,
    required this.email,
    required this.password,
    required this.image,
  //  required this.favorite,
   // required this.promotion,
  }) : super(key: key);

  @override
  State<RootPageUI> createState() => _RootPageUIState();
}

class _RootPageUIState extends State<RootPageUI> {
  List page = [
    HomeMenuUI(),
    SettingUI(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: page.elementAt(selectedIndex),
       bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[300],
        selectedItemColor: Color(0xffb98068),  
        currentIndex: selectedIndex,
        items: [
           BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.coffee),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.gear),
            label: 'Setting',
          ),
        ]
       ),
    );
  }
}
