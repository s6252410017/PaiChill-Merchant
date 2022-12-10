import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_paicill_app/views/aboutus_ui.dart';
import 'aboutapp_ui.dart';
import 'editshop_ui.dart';
import 'loginpage_ui.dart';

class SettingUI extends StatefulWidget {
  const SettingUI({Key? key}) : super(key: key);

  @override
  State<SettingUI> createState() => _SettingUIState();
}

class _SettingUIState extends State<SettingUI> {
  int _selectedIndex = 0;
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
      _selectedIndex = index;
    });
  }

  // final List<Map> myProducts =
  //     List.generate(100000, (index) => {"id": index, "name": "Product $index"})
  //         .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Color(0xffb98068)),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: Text(
          "Setting",
          style:
              TextStyle(
                fontWeight: FontWeight.bold, 
                color: Color(0xffb98068)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
              ),
            ),
            // SizedBox(
            //   height: 0,
            //   width: 0,
            // ),
            //แถบคำสั่งตั้งค่า
            //เส้นขีดขั้น
            Divider(
              height: 1.5,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Color(0xffb98068),
            ),
            //แถบที่ 1
            Container(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 15.0,
              ),
              color: Colors.white,
              height: 80.0,
              child: ListTile(
                onTap: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditshopUI(),
                        ),
                      );
                },
                title: Text(
                  'Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                leading: Icon(
                  Icons.settings,
                  size: 50,
                  color: Color(0xffb98068),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffb98068),
                ),
              ),
            ),
            //เส้นขีดขั้น
            Divider(
              height: 1,
              thickness: 1.5,
              indent: 0,
              endIndent: 0,
              color: Color(0xffb98068),
            ),
            //แถบที่ 2
            Container(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 15.0,
              ),
              color: Colors.white,
              height: 80.0,
              child: ListTile(
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutApp(),
                        ),
                      );
                },
                title: Text(
                  'About App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                leading: Icon(
                  FontAwesomeIcons.circleExclamation,
                  size: 50,
                  color: Color(0xffb98068),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffb98068),
                ),
              ),
            ),
            //เส้นขีดขั้น
            Divider(
              height: 1,
              thickness: 1.5,
              indent: 0,
              endIndent: 0,
              color: Color(0xffb98068),
            ),

              //แถบที่ 3
            Container(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 15.0,
              ),
              color: Colors.white,
              height: 80.0,
              child: ListTile(
                onTap: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUs(),
                        ),
                      );
                },
                title: Text(
                  '  About Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                leading: Icon(
                  FontAwesomeIcons.code,
                  size: 40,
                  color: Color(0xffb98068),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffb98068),
                ),
              ),
            ),
            //เส้นขีดขั้น
            Divider(
              height: 1,
              thickness: 1.5,
              indent: 0,
              endIndent: 0,
              color: Color(0xffb98068),
            ),

            //เริ่ม ปุ่มออกจากระบบ
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 350,
              ),
              child: SizedBox(
                width: 260,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageUI(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                      ),
                      backgroundColor: Color(0xffb98068)),
                ),
              ),
            ),
            //ปิด ปุ่มออกจากระบบ
            SizedBox(
              width: 15,
              height: 15,
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[500],
              ),
            ),
            //แถบ
          ],
        ),
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.coffee),
      //       label: 'Home',
      //       backgroundColor: Colors.white,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(FontAwesomeIcons.gear),
      //       label: 'Setting',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
