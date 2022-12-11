import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_paicill_app/views/feedback_ui.dart';
import 'package:shop_paicill_app/views/loginpage_ui.dart';
import 'package:shop_paicill_app/views/setting_ui.dart';
import 'package:shop_paicill_app/views/detailshop_ui.dart';
import 'package:shop_paicill_app/views/viewfeedback_ui.dart';
import 'detailshop1_ui.dart';
import 'editshop_ui.dart';
import 'mainmenu_ui.dart';

class HomeMenuUI extends StatefulWidget {
  const HomeMenuUI({Key? key}) : super(key: key);

  @override
  State<HomeMenuUI> createState() => _HomeMenuUIState();
}

class _HomeMenuUIState extends State<HomeMenuUI> {
 List page = [
    HomeMenuUI(),
    SettingUI(),
  ];

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios, 
        //     color: Color(0xffb98068)
        //     ),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffb98068)
            ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //ปุ่มไปหน้า Detail
              SizedBox(
                height: 100.0,
              ),
              ElevatedButton.icon(
                onPressed: () { 
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailShop1UI(),
                        ),
                      );
                 },
                icon: Icon(
                  FontAwesomeIcons.circleInfo,
                  size: 50,
                ),         
                label: Text(
                  'DETAIL SHOP',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 30,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80,
                    100.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Color(0xffb98068),
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedBackUI(docId: '',),
                        ),
                      );
                },
                icon: Icon(
                  FontAwesomeIcons.squareRss,
                  size: 50,
                ),
                label: Text(
                  'FEEDBACK',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 30,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80,
                    100.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Color(0xffb98068),
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditshopUI(),
                        ),
                      );
                },
                icon: Icon(
                  FontAwesomeIcons.squarePen,
                  size: 50,
                ),
                label: Text(
                  'EDIT SHOP',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kanit',
                    fontSize: 30,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80,
                    100.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Color(0xffb98068),
                ),
              ),
              //จบที่ปุ่ม Edit Shop
            ],
            
          ),
        ),
      ),
      
    );
  }
}