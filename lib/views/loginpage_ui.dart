import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_paicill_app/views/registerpage_ui.dart';
import 'package:shop_paicill_app/views/rootpage_ui.dart';

import '../models/listid.dart';

class LoginPageUI extends StatefulWidget {
  const LoginPageUI({Key? key}) : super(key: key);

  @override
  State<LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  TextEditingController txEmail = TextEditingController();
  TextEditingController txPassword = TextEditingController();

  String user = "admin";
  String pass = "1234";

  List<ListId> listId = [
     ListId(
      name: 'PaiChill',
      //sex: '1',
      //birthdate: '18/8/1997',
      email: 'paichillshop@gmail.com',
      password: '1234',
      image: '',
      gmap: '',
      district: '',
      province: '',
      phonenum: '',
      facebook: '',
      //favorite: [],
      //promotion: '',
   //   latlng: [],
    ),
    ListId(
      
      name: 'trs',
      //sex: '1',
      //birthdate: '18/8/1997',
      email: 'admin',
      password: '0000',
      image: '',
      gmap: '',
      district: '',
      province: '',
      phonenum: '',
      facebook: '',
      //favorite: [],
      //promotion: '',
   //   latlng: [],
    ),
    ListId(
      name: 'Apisit Kulkham',
      // sex: '1',
      // birthdate: '22/5/1995',
      email: '1111@gmail.com',
      password: '123456789',
      image: '',
       gmap: '',
      district: '',
      province: '',
      phonenum: '',
      facebook: '',
      // favorite: [],
      // promotion: '',
     // latlng: [],
    ),
    ListId(
      name: 'somying deemak',
      // sex: '2',
      // birthdate: '30/8/2002',
      email: '2222@gmail.com',
      password: '123456789',
      image: '',
       gmap: '',
      district: '',
      province: '',
      phonenum: '',
      facebook: '',
      // favorite: [],
      // promotion: '',
     // latlng: [],
    ),
    ListId(
      name: 'sukda seesuay',
      // sex: '3',
      // birthdate: '11/3/1991',
      email: '3333@gmail.com',
      password: '123456789',
      image: '',
       gmap: '',
      district: '',
      province: '',
      phonenum: '',
      facebook: '',
      // favorite: [],
      // promotion: '',
     // latlng: [],
    ),
    ListId(
      name: 'manit jaiaon',
      // sex: '1',
      // birthdate: '18/8/1997',
      email: '4444@gmail.com',
      password: '123456789',
      image: '',
       gmap: '',
      district: '',
      province: '',
      phonenum: '',
      facebook: '',
      // favorite: [],
      // promotion: '',
      //latlng: [],
    ),
  ];

  showWarningDialog(context, msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน..!!',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            content: Text(
              msg,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      txEmail.text = '';
                      txPassword.text = '';
                    });
                  },
                  child: Text(
                    'ตกลง',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Color(0xffb98068),)
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
           
            SizedBox(
              height: 85,
            ),
            Image.asset(
              'assets/images/pro4.png',
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: .0,
              ),
              child: SizedBox(
                height: 65.0,
                child: TextField(
                  controller: txEmail,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xffb98068),
                      ),
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color(0xffb98068),
                      ),
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xffb98068),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb98068),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: SizedBox(
                height: 65.0,
                child: TextField(
                  controller: txPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xffb98068),
                      ),
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Color(0xffb98068),
                      ),
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Color(0xffb98068),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb98068),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1,
              indent: 25,
              endIndent: 25,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 60.0,
                top: 30,
              ),
              child: Row(children: [
                SizedBox(
                  width: 120,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (txEmail.text.length == 0) {
                        showWarningDialog(context, 'กรุณาป้อน Email');
                      } else if (txPassword.text.length == 0) {
                        showWarningDialog(context, 'กรุณาป้อน Password');
                      } else {
                        for (int i = 0; i < listId.length; i++) {
                          if (listId[i].email == txEmail.text) {
                            if (listId[i].password == txPassword.text) {
                              print('Login Succes');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RootPageUI(
                                    name: listId[i].name,
                                    //sex: listId[i].sex,
                                    // birthdate: listId[i].birthdate,
                                    email: listId[i].email,
                                    password: listId[i].password,
                                    image: listId[i].image,
                                    // favorite: listId[i].favorite,
                                    // promotion: listId[i].promotion,
                                  ),
                                ),
                              );
                              break;
                            } else {
                              showWarningDialog(
                                  context, 'กรุณาตรวจสอบ password');
                              break;
                            }
                          }
                        }
                      }
                    },
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      primary: Color(0xffb98068),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 28.0,
                ),
                SizedBox(
                  width: 120,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPageUI(),
                        ),
                      );
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: Color(0xffb98068),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xffb98068)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 20.0,
              ),
              child: SizedBox(
                width: 260,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.facebookF,
                  ),
                  label: Text(
                    'Facebook',
                    style: TextStyle(
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
                      primary: Color(0xFF1E5A99)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 10,
              ),
              child: SizedBox(
                width: 260,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.google,
                  ),
                  label: Text(
                    'Gmail',
                    style: TextStyle(
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
                      primary: Color(0xFFFF3200)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
