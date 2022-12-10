import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_paicill_app/views/loginpage_ui.dart';

class AccountPageUI extends StatefulWidget {
  String name = '';
  String sex = '';
  String birthdate = '';
  String email = '';
  String password = '';
  String image = '';
  List favorite = [];
  String promotion = '';

  AccountPageUI({
    Key? key,
    /* required this.name,
    required this.sex,
    required this.birthdate,
    required this.email,
    required this.password,
    required this.image,
    required this.favorite,
    required this.promotion, */
  }) : super(key: key);

  @override
  State<AccountPageUI> createState() => _AccountPageUIState();
}

class _AccountPageUIState extends State<AccountPageUI> {
  File? imageUser;

//เปิดแกลอรี่
  Future selectImgFromGallery() async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageSelect == null) {
      return;
    }
    //กรณีเลือกรูป
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageUser = imageSelectPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 80.0,
              ),
              child: SizedBox(
                height: 180,
                width: 180,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      radius: 100.0,
                      backgroundColor: Colors.black54,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          100.0,
                        ),
                        child: imageUser == null
                            ? Image.asset(
                                'assets/images/default_photo.png',
                                width: 160.0,
                                height: 160.0,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(imageUser!.path),
                                width: 160.0,
                                height: 160.0,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -25,
                      child: RawMaterialButton(
                        onPressed: () {
                          selectImgFromGallery();
                        },
                        elevation: 2.0,
                        fillColor: Colors.black54,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white60,
                        ),
                        padding: EdgeInsets.all(6.0),
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 390,
              height: 50,
              color: Color.fromARGB(255, 236, 233, 233),
              child: Row(
                children: [
                  SizedBox(
                    width: 33,
                  ),
                  Container(
                    width: 170,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'Terasak Treepak',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text(
                      'Male',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 390,
              height: 20,
              color: Color.fromARGB(255, 236, 233, 233),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      '5 October 1996', //22 May 1995
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: 390,
              height: 50,
              color: Color.fromARGB(255, 236, 233, 233),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      's6252410017@sau.ac.th',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            //menu
            SizedBox(
              height: 40,
            ),
            Container(
              color: Color.fromARGB(255, 181, 177, 177),
              height: 55.0,
              child: ListTile(
                onTap: () {},
                title: Text(
                  'Edit Profile',
                ),
                leading: Icon(
                  Icons.settings,
                  color: Colors.white60,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 236, 233, 233),
              height: 55.0,
              child: ListTile(
                onTap: () {},
                title: Text(
                  'My Favorite',
                ),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 181, 177, 177),
              height: 55.0,
              child: ListTile(
                onTap: () {},
                title: Text(
                  'Code Promotion',
                ),
                leading: Icon(
                  Icons.qr_code,
                  color: Colors.white60,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 234, 201, 201),
              height: 55.0,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPageUI(),
                    ),
                  );
                },
                title: Text(
                  'SignOut',
                ),
                leading: Text(
                  '',
                ),
                trailing: Icon(
                  Icons.exit_to_app,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
