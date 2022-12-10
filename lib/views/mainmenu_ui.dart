import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_paicill_app/views/setting_ui.dart';


import 'homemenu_ui.dart';

class MainMenuUI extends StatefulWidget {
  const MainMenuUI({Key? key}) : super(key: key);

  @override
  State<MainMenuUI> createState() => _MainMenuUIState();
}

class _MainMenuUIState extends State<MainMenuUI> {
  List page = [
    HomeMenuUI(),
    SettingUI(),
  ];
  
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    
    Text(
      '',
      style: optionStyle,
    ),
    Text(
      '',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

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
