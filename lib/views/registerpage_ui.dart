import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_paicill_app/models/listid.dart';

import '../services/google_services.dart';
import '../services/other.dart';

class RegisterPageUI extends StatefulWidget {
  const RegisterPageUI({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPageUI> createState() => _RegisterPageUIState();
}

class _RegisterPageUIState extends State<RegisterPageUI> {
  final formKey = GlobalKey<FormState>();
  //ListId shopId = ListId();
  File? imageUser;
  String fileName = '', path = '';
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  TextEditingController txName = TextEditingController();
  int rdSex = 0;
  // DateTime birthDate = DateTime.now();
  TextEditingController txEmail = TextEditingController();
  TextEditingController txPassword = TextEditingController();
  TextEditingController txConfirm = TextEditingController();
  TextEditingController txDistrict = TextEditingController();
  TextEditingController txProvince = TextEditingController();
  TextEditingController txFacebook = TextEditingController();
  TextEditingController txPhonenum = TextEditingController();
  TextEditingController txLocation = TextEditingController();
  //File? imageUser;
  File? imageShop;
  File? imageDetail1, imageDetail2, imageDetail3, imageDetail4, imageDetail5;
  File? imagePreview1,
      imagePreview2,
      imagePreview3,
      imagePreview4,
      imagePreview5;
  File? imageMenu1, imageMenu2, imageMenu3, imageMenu4, imageMenu5;
  String imgePre1Path = '', imagePre1Name = '';

  get images => null;

  /* Future selectImgFromCamera() async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.camera);
    //ตรวจสอบว่าเลือกไหม
    if (imageSelect == null) {
      return;
    }
    //กรณีเลือกรูป
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageUser = imageSelectPath;
    });
  } */

  //open gallery & save to SharedPreferences
  imagePre1() async {
    XFile? picImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picImage != null) {
      setState(() {
        imagePreview1 = File(picImage.path);
      });
      //setpath to save SharedPreferences
      Directory imgDir = await getApplicationDocumentsDirectory();
      String imgPath = imgDir.path;
      var imgName = basename(picImage.path);
      File localImg = await File(picImage.path).copy('$imgPath/$imgName');
      imgePre1Path = localImg.path;
      imagePre1Name = picImage.name;
      print(imgePre1Path);
      print(imagePre1Name);
      var getUrlPre1;
      String setUrlImagePre1 = '';
      getUrlPre1 = await GoogleServices()
          .uploadFirebaseStorage(imgePre1Path, imagePre1Name);
      print(getUrlPre1);
      /* setUrlImagePre1 = getUrlPre1; */
      print(setUrlImagePre1);
    } else {
      return;
    }
  }

  //เปิดแกลอรี่
  Future selectImgFromGallery(String selectImage) async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageSelect == null) {
      return;
    }
    //กรณีเลือกรูป
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      if (selectImage == 'imageDetail') {
        imageDetail1 = imageSelectPath;
      }

      switch (selectImage) {
        case 'imageShop':
          imageShop = imageSelectPath;

          break;
        case 'imagePreview1':
          imagePreview1 = imageSelectPath;
          break;
        case 'imagePreview2':
          imagePreview2 = imageSelectPath;
          break;
        case 'imagePreview3':
          imagePreview3 = imageSelectPath;
          break;
        case 'imagePreview4':
          imagePreview4 = imageSelectPath;
          break;
        case 'imageMenu1':
          imageMenu1 = imageSelectPath;
          break;
        case 'imageMenu2':
          imageMenu2 = imageSelectPath;
          break;
        case 'imageMenu3':
          imageMenu3 = imageSelectPath;
          break;
        case 'imageMenu4':
          imageMenu4 = imageSelectPath;
          break;
        case 'imageMenu5':
          imageMenu5 = imageSelectPath;
          break;
      }
      // imageShop = imageSelect2Path;
      // imageDetail = imageSelectPath;
    });
    // final imageSelect2Path = File(imageSelect.path);
    // setState(() {
    //  // imageUser = imageSelectPath;
    //   imageShop = imageSelect2Path;
    //   // imageDetail = imageSelectPath;

    // });
  }

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
                  },
                  child: Text(
                    'ตกลง',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffb98068)),
                ),
              ),
            ],
          );
        });
  }

  //Check Box Coffee Type
  int cbCoffee = 0;
  bool isDefault = false;
  int boolToInt(bool data) => data ? 1 : 0;
  //bool intToBool(int data) => data == 0 ? false : true;
  bool isDrip = false;
  bool isMokapot = false;
  bool isSyphon = false;
  //Check Box Detail
  bool isCarpark = false;
  bool isWifi = false;
  TextEditingController txType1 = TextEditingController();
  TextEditingController txType2 = TextEditingController();
  TextEditingController txType3 = TextEditingController();
  TextEditingController txType4 = TextEditingController();

  //open camera
  openCamera() async {
    XFile? picImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (picImage != null) {
      setState(() {
        imageUser = File(picImage.path);
      });
    } else {
      return;
    }

    //setpath to save SharedPreferences
    Directory imgDir = await getApplicationDocumentsDirectory();
    String imgPath = imgDir.path;
    var imgName = basename(picImage.path);
    File localImg = await File(picImage.path).copy('$imgPath/$imgName');
    path = localImg.path;
    fileName = picImage.name.substring(60, 75);
    print(path);
    print(fileName);
  }

  //open gallery & save to SharedPreferences
  openGallery() async {
    XFile? picImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picImage != null) {
      setState(() {
        imageUser = File(picImage.path);
      });
      //setpath to save SharedPreferences
      Directory imgDir = await getApplicationDocumentsDirectory();
      String imgPath = imgDir.path;
      var imgName = basename(picImage.path);
      File localImg = await File(picImage.path).copy('$imgPath/$imgName');
      path = localImg.path;
      fileName = picImage.name.substring(60, 75);
      print(path);
      print(fileName);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text(
                  "{$snapshot.error}",
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Color(0xffb98068)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xffb98068)),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      //title
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50.0,
                          right: 50.0,
                          top: 20.0,
                        ),
                        child: Text(
                          "Create an account, It's free",
                          style: TextStyle(
                            color: Color(0xffb98068),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // ),

//Email
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 40.0,
                          top: 10.0,
                        ),
                        child: SizedBox(
                          height: 65.0,
                          child: TextField(
                            key: formKey,
                            controller: txEmail,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.0,
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
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 40.0,
                        ),
                        child: SizedBox(
                          height: 65.0,
                          child: TextField(
                            controller: txPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.0,
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
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 40.0,
                        ),
                        child: SizedBox(
                          height: 65.0,
                          child: TextField(
                            controller: txConfirm,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.0,
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
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //เส้นขีด Divider
                      Divider(
                        height: 1,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffb98068),
                      ),
                      //Text บนปุ่มเพิ่มรูป Shop Image
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 0,
                          right: 230.0,
                        ),
                        child: Text(
                          "Shop Image Head", //imagehead in Firebase
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            color: Color(0xffb98068),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //ปุ่มเพิ่มรูป Shop Head Image
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          bottom: 5.0,
                          left: 15.0,
                        ),
                        child: Container(
                          height: 160.0,
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              //รูปที่ 1
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(0)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imageShop == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              // width: 120.0,
                                              // height: 100.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imageShop!.path),
                                              // width: 120.0,
                                              // height: 150.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imageShop');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //ปุ่มช่อง 2 Preview Image
                      //เส้นขีด Divider
                      Divider(
                        height: 1,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffb98068),
                      ),
                      //Text บนปุ่มเพิ่มรูป Preview Image
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 0,
                          right: 250.0,
                        ),
                        child: Text(
                          "Preview Image",
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            color: Color(0xffb98068),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //ปุ่มเพิ่มรูป Preview Image
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 15,
                          bottom: 5.0,
                        ),
                        child: Container(
                          height: 160.0,
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              //รูปที่ 1
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imagePreview1 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              // width: 120.0,
                                              // height: 100.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imagePreview1!.path),
                                              // width: 120.0,
                                              // height: 150.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          /* selectImgFromGallery('imagePreview1'); */
                                          imagePre1();
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //รูปที่ 2
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imagePreview2 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              // width: 120.0,
                                              // height: 100.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imagePreview2!.path),
                                              // width: 120.0,
                                              // height: 150.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imagePreview2');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //รูปที่ 3
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imagePreview3 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              // width: 120.0,
                                              // height: 100.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imagePreview3!.path),
                                              // width: 120.0,
                                              // height: 150.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imagePreview3');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //รูปที่ 4
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imagePreview4 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              // width: 120.0,
                                              // height: 100.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imagePreview4!.path),
                                              // width: 120.0,
                                              // height: 150.0,
                                              height: 192.0,
                                              width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imagePreview4');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //ปุ่ม 3 Coffee Type Image
                      //เส้นขีด Divider
                      Divider(
                        height: 1,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffb98068),
                      ),
                      //Text บนปุ่มเพิ่มรูป Shop Image
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 0,
                          right: 270.0,
                        ),
                        child: Text(
                          "Coffee Type",
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            color: Color(0xffb98068),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //ปุ่ม Checkbox Coffee Type
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                          left: 5,
                          bottom: 0,
                        ),
                        child: SizedBox(
                          height: 50,
                          width: 400,
                          child: Stack(
                              clipBehavior: Clip.antiAlias,
                              // fit: StackFit.expand,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //Checkbox Coffee Type
                                    //Checkbox Default
                                    Checkbox(
                                      onChanged: (data) {
                                        setState(() {
                                          isDefault = data!;
                                          if (data == false) {
                                            txType1.text = 'txType1';
                                          }
                                        });
                                      },
                                      value: isDefault,
                                      activeColor: Color(0xffb98068),
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: Color(0xffb98068),
                                      ),
                                    ),
                                    Text(
                                      'Default',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    //Checkbox Drip
                                    Checkbox(
                                      onChanged: (data) {
                                        setState(() {
                                          isDrip = data!;
                                          if (data == false) {
                                            txType2.text = 'txType2';
                                          }
                                        });
                                      },
                                      value: isDrip,
                                      activeColor: Color(0xffb98068),
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: Color(0xffb98068),
                                      ),
                                    ),
                                    Text(
                                      'Drip',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    //Checkbox Mokapot
                                    Checkbox(
                                      onChanged: (data) {
                                        setState(() {
                                          isMokapot = data!;
                                          if (data == false) {
                                            txType3.text = '';
                                          }
                                        });
                                      },
                                      value: isMokapot,
                                      activeColor: Color(0xffb98068),
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: Color(0xffb98068),
                                      ),
                                    ),
                                    Text(
                                      'Mokapot',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),

                                    //Checkbox Syphon
                                    Checkbox(
                                      onChanged: (data) {
                                        setState(() {
                                          isSyphon = data!;
                                          if (data == false) {
                                            txType4.text = '';
                                          }
                                        });
                                      },
                                      value: isSyphon,
                                      activeColor: Color(0xffb98068),
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: Color(0xffb98068),
                                      ),
                                    ),
                                    Text(
                                      'Syphon',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // CheckboxListTile(
                                    //   title: Text(
                                    //     "Syphon",
                                    //   ),
                                    //   secondary: Icon(Icons.coffee),
                                    //   controlAffinity: ListTileControlAffinity.platform,
                                    //   value: isChecked,
                                    //   onChanged: (value) {
                                    //     setState(() {
                                    //       isChecked = false;
                                    //     });
                                    //   },
                                    //   activeColor: Colors.amber,
                                    //   checkColor: Colors.black,
                                    // ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                      //ปุ่ม 4 Image Menu (Menu signature)
                      //เส้นขีด Divider
                      Divider(
                        height: 1,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffb98068),
                      ),
                      //Text บนปุ่มเพิ่มรูป Menu Image
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 0,
                          right: 250.0,
                        ),
                        child: Text(
                          "Menu Signature",
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            color: Color(0xffb98068),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //ปุ่มเพิ่มรูป Menu Signature
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 15,
                          bottom: 5.0,
                        ),
                        child: Container(
                          height: 160.0,
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              //รูปที่ 1
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imageMenu1 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              width: 120.0,
                                              height: 100.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imageMenu1!.path),
                                              width: 120.0,
                                              height: 150.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imageMenu1');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //รูปที่ 2
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imageMenu2 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              width: 120.0,
                                              height: 100.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imageMenu2!.path),
                                              width: 120.0,
                                              height: 150.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imageMenu2');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //รูปที่ 3
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imageMenu3 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              width: 120.0,
                                              height: 100.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imageMenu3!.path),
                                              width: 120.0,
                                              height: 150.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imageMenu3');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //รูปที่ 4
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imageMenu4 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              width: 120.0,
                                              height: 100.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imageMenu4!.path),
                                              width: 120.0,
                                              height: 150.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imageMenu4');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //รูปที่ 5
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffb98068),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: imageMenu5 == null
                                          ? Image.asset(
                                              'assets/images/imageicon.png',
                                              width: 120.0,
                                              height: 100.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              File(imageMenu5!.path),
                                              width: 120.0,
                                              height: 150.0,
                                              // height: 192.0,
                                              // width: 340.0,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -20,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          selectImgFromGallery('imageMenu5');
                                        },
                                        elevation: 2.0,
                                        fillColor: Color(0xffb98068),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.all(6.0),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //ปุ่ม 5 Detail Shop (Detail Shop)
                      //เส้นขีด Divider
                      Divider(
                        height: 1,
                        thickness: 1.5,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffb98068),
                      ),
                      //Text บนปุ่มเพิ่มรูป Detail Shop
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 0,
                          right: 275.0,
                        ),
                        child: Text(
                          "Detail Shop",
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            color: Color(0xffb98068),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //ปุ่ม Checkbox Detail Shop
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                          left: 5,
                          bottom: 0,
                        ),
                        child: SizedBox(
                          height: 50,
                          width: 400,
                          child: Stack(
                              clipBehavior: Clip.antiAlias,
                              // fit: StackFit.expand,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //CheckboxDetail Shop
                                    //Checkbox carpark

                                    Checkbox(
                                      onChanged: (data) {
                                        isCarpark ? 1 : 0;
                                        setState(() {
                                          isCarpark = data!;
                                          if (data == 0) {
                                            isCarpark ? 1 : 0;
                                            print(isCarpark);
                                          }
                                        });
                                      },
                                      value: isCarpark,
                                      activeColor: Color(0xffb98068),
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: Color(0xffb98068),
                                      ),
                                    ),
                                    Text(
                                      'Carpark',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    //Checkbox wifi
                                    Checkbox(
                                      onChanged: (data) {
                                        setState(() {
                                           //bool intToBool(int data) => data == 0 ? false : true;
                                           
                                          isWifi = data!;
                                          if (data == boolToInt) {
                                           int boolToInt(bool data) => data ? 1 : 0;
                                          }
                                        });
                                      },
                                      value: isWifi,
                                      activeColor: Color(0xffb98068),
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: Color(0xffb98068),
                                      ),
                                    ),
                                    Text(
                                      'Wifi',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                      //ช่องใส่ Shop name
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 40.0,
                          top: 1.0,
                        ),
                        child: SizedBox(
                          height: 65.0,
                          child: TextField(
                            controller: txName,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.0,
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
                              hintText: 'Shop Name',
                              hintStyle: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //ช่่องใส่ District and Province
                      Row(
                        children: [
                          //District
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 30.0,
                              top: 1.0,
                            ),
                            child: SizedBox(
                              height: 65.0,
                              width: 150,
                              child: TextField(
                                controller: txDistrict,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(8),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
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
                                  hintText: 'District',
                                  hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Province
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              right: 0.0,
                              top: 1.0,
                            ),
                            child: SizedBox(
                              height: 65.0,
                              width: 150,
                              child: TextField(
                                controller: txProvince,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(8),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
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
                                  hintText: 'Province',
                                  hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //ช่่องใส่ facebook and Phonenum
                      Row(
                        children: [
                          //facebook
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 30.0,
                              top: 1.0,
                            ),
                            child: SizedBox(
                              height: 65.0,
                              width: 150,
                              child: TextField(
                                controller: txFacebook,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(8),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
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
                                  hintText: 'Facebook',
                                  hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Phonenum
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0.0,
                              right: 0.0,
                              top: 1.0,
                            ),
                            child: SizedBox(
                              height: 65.0,
                              width: 150,
                              child: TextField(
                                controller: txPhonenum,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(8),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
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
                                  hintText: 'Phonenumber',
                                  hintStyle: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //ช่องใส่ Shop Location
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 40.0,
                          top: 1.0,
                        ),
                        child: SizedBox(
                          height: 65.0,
                          child: TextField(
                            controller: txLocation,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.0,
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
                              hintText: 'Shop Location (GoogleMap Link)',
                              hintStyle: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //  //ปุ่ม 6 Shop Location (DB : shoplocation)
                      // //เส้นขีด Divider
                      // Divider(
                      //   height: 1,
                      //   thickness: 1.5,
                      //   indent: 20,
                      //   endIndent: 20,
                      //   color: Color(0xffb98068),
                      // ),
                      // //Text บนปุ่มเพิ่มรูป Detail Shop
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 8.0,
                      //     left: 0,
                      //     right: 275.0,
                      //   ),
                      //   child: Text(
                      //     "Detail Shop",
                      //     style: TextStyle(
                      //       fontFamily: 'Kanit',
                      //       color: Color(0xffb98068),
                      //       fontSize: 15.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),

                      //ปุ่ม SignUp
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 65.0,
                          right: 60.0,
                          top: 20.0,
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: 120,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                var getUrlPic;
                                String setUrlPic = '';

                                if (fileName != '') {
                                  getUrlPic = await GoogleServices()
                                      .uploadFirebaseStorage(path, fileName);
                                  setUrlPic = getUrlPic;
                                }
                                for (var i = 1; i < 5; i++) {
                                  switch (i) {
                                    case 1:
                                      'imagehead';
                                      setUrlPic == '' ? '' : imageShop;
                                      break;
                                    case 2:
                                      'imagepre1';
                                      setUrlPic == '' ? '' : imagePreview1;
                                      break;
                                  }
                                }

                                if (txName.text.length == 0) {
                                  showWarningDialog(context, 'กรุณาป้อน ชื่อ');
                                } else if (txEmail.text.length == 0) {
                                  showWarningDialog(context, 'กรุณาป้อน Email');
                                } else if (txPassword.text.length == 0) {
                                  showWarningDialog(
                                      context, 'กรุณาป้อน Password');
                                } else if (txConfirm.text.length == 0) {
                                  showWarningDialog(
                                      context, 'กรุณาป้อน Confirm Password');
                                } else if (txPassword.text != txConfirm.text) {
                                  showWarningDialog(context,
                                      'กรุณาป้อน Password และ Confirm Password ให้ตรงกัน');
                                } else {
                                  try {
                                    CollectionReference addUserAccount =
                                        FirebaseFirestore.instance
                                            .collection("shop_account");
                                    await addUserAccount.add({
                                      'email': txEmail.text.trim(),
                                      'name': txName.text,
                                      'coffeetype': {
                                        'default': isDefault.toString(),
                                        'drip': isDrip.toString(),
                                        'mokapot': isMokapot.toString(),
                                        'syphon': isSyphon.toString(),
                                      },
                                      'detailshop': {
                                        'carpark': isCarpark.toString(),
                                        'wifi': isWifi.toString(),
                                        'district': txDistrict.text,
                                        'facebook': txFacebook.text,
                                        'map': txLocation.text,
                                        'phonenum': txPhonenum.text,
                                        'province': txProvince.text,
                                      },
                                      'shoplocation': {
                                        'location': txLocation.text,
                                      },
                                      'favorite': [txEmail.text.trim()]

                                      // 'imagemenu': {
                                      //   'imagemenu1':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagemenu2':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagemenu3':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagemenu4':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagemenu5':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      // },
                                      // 'imagepreview': {
                                      //   'imagepre1':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagepre2':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagepre3':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagepre4':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      //   'imagepre5':
                                      //       setUrlPic == '' ? '' : setUrlPic,
                                      // },
                                    });
                                    await await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: txEmail.text.trim(),
                                      password: txPassword.text.trim(),
                                    );

                                    await OtherServices()
                                        .saveDataToSP(
                                            txName.text,
                                            txDistrict,
                                            txProvince,
                                            txFacebook,
                                            txPhonenum,
                                            txLocation,
                                            txEmail.text.trim())
                                        .then(
                                            (value) => Navigator.pop(context));
                                  } on FirebaseAuthException catch (e) {
                                    OtherServices().showWarningDialog(
                                        context, 'ระบบขัดข้องแจ้งAdmin');
                                    print(e);
                                  }
                                }
                              },
                              child: Text(
                                'SignUp',
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
                            width: 25.0,
                          ),
                          SizedBox(
                            width: 120,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                txName.text = "";
                                txEmail.text = "";
                                txPassword.text = "";
                                txConfirm.text = "";
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'Kanit',
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
                      SizedBox(
                        width: 25.0,
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Scaffold();
        });
  }
 
}
