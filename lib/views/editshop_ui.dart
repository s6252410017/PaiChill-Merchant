import 'dart:io';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:shop_paicill_app/views/mainmenu_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/listid.dart';
import 'mainmenu_ui.dart';
import '../models/user_data.dart';

class EditshopUI extends StatefulWidget {
  const EditshopUI({Key? key}) : super(key: key);

  @override
  State<EditshopUI> createState() => _EditshopUIState();
}

class _EditshopUIState extends State<EditshopUI> {
  final user = UserData.myUser;
  late LocationData cerrenPosition;
  late GoogleMapController mapController;
  Location location = Location();
  //LatLng initialcameraposition = LatLng(13.707491037300096, 100.35616450859982);
  //Set<Marker> _markers = {};
  String facebook = "https://www.facebook.com/turtleapisit";
  String amazon = "https://www.facebook.com/cafeamazonofficial";
  String map = "https://goo.gl/maps/EF3dpTnMVEvjtQAEA";
  String _value = '';

  TextEditingController txProvince = TextEditingController();
  TextEditingController txDistrict = TextEditingController();
  TextEditingController txLocation = TextEditingController();

  double _currentSliderValue = 0;

  set gmap(String gmap) {}

  //mapmarker
  // void _onMapCreated(mapController) {
  //   setState(() {
  //     _markers.add(Marker(
  //       markerId: MarkerId('sau1'),
  //       position: initialcameraposition,
  //     ));
  //   });
  // }

//methodเปิดเว็บ
  Future<void> _launchInBrowser(Uri url) async {
    if (!await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //methodโทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    print(phoneNumber);
    final Uri launchUri = Uri(
      scheme: "tel",
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //File? imageUser;
  File? editimageShop;
  File? imageDetail1,
      editimageDetail2,
      editimageDetail3,
      editimageDetail4,
      editimageDetail5;
  File? editimagePreview1,
      editimagePreview2,
      editimagePreview3,
      editimagePreview4,
      editimagePreview5;
  File? editimageMenu1,
      editimageMenu2,
      editimageMenu3,
      editimageMenu4,
      editimageMenu5;

  get images => null;
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
        case 'editimageShop':
          editimageShop = imageSelectPath;
          break;
        case 'editimagePreview1':
          editimagePreview1 = imageSelectPath;
          break;
        case 'editimagePreview2':
          editimagePreview2 = imageSelectPath;
          break;
        case 'editimagePreview3':
          editimagePreview3 = imageSelectPath;
          break;
        case 'editimagePreview4':
          editimagePreview4 = imageSelectPath;
          break;
        case 'editimageMenu1':
          editimageMenu1 = imageSelectPath;
          break;
        case 'editimageMenu2':
          editimageMenu2 = imageSelectPath;
          break;
        case 'editimageMenu3':
          editimageMenu3 = imageSelectPath;
          break;
        case 'editimageMenu4':
          editimageMenu4 = imageSelectPath;
          break;
        case 'editimageMenu5':
          editimageMenu5 = imageSelectPath;
          break;
      }
    });
  }

  bool isChecked0 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  TextEditingController txType0 = TextEditingController();
  TextEditingController txType1 = TextEditingController();
  TextEditingController txType2 = TextEditingController();
  TextEditingController txType3 = TextEditingController();
  TextEditingController txType4 = TextEditingController();
  TextEditingController txType5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xffb98068)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Edit Shop",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xffb98068)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //รูปที่ 1
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xffb98068),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                      ),
                      child: editimageShop == null
                          ? Image.asset(
                              'assets/images/Shop.png',
                              // width: 120.0,
                              // height: 100.0,
                              height: 192.0,
                              width: 390.0,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              File(editimageShop!.path),
                              // width: 120.0,
                              // height: 150.0,
                              height: 192.0,
                              width: 390.0,
                              fit: BoxFit.fill,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -20,
                      child: RawMaterialButton(
                        onPressed: () {
                          selectImgFromGallery('editimageShop');
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
              //Text บนปุ่มเพิ่มรูป Preview Image
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 0,
                  right: 228.0,
                ),
                child: Text(
                  "บรรยากาศภายในร้าน",
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
                  left: 1,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimagePreview1 == null
                                  ? Image.asset(
                                      'assets/images/Shop.png',
                                      // width: 120.0,
                                      // height: 100.0,
                                      height: 192.0,
                                      width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimagePreview1!.path),
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
                                  selectImgFromGallery('editimagePreview1');
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimagePreview2 == null
                                  ? Image.asset(
                                      'assets/images/Shop.png',
                                      // width: 120.0,
                                      // height: 100.0,
                                      height: 192.0,
                                      width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimagePreview2!.path),
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
                                  selectImgFromGallery('editimagePreview2');
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimagePreview3 == null
                                  ? Image.asset(
                                      'assets/images/Shop.png',
                                      // width: 120.0,
                                      // height: 100.0,
                                      height: 192.0,
                                      width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimagePreview3!.path),
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
                                  selectImgFromGallery('editimagePreview3');
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimagePreview4 == null
                                  ? Image.asset(
                                      'assets/images/Shop.png',
                                      // width: 120.0,
                                      // height: 100.0,
                                      height: 192.0,
                                      width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimagePreview4!.path),
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
                                  selectImgFromGallery('editimagePreview4');
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
              //coffee type
              Padding(
                padding: const EdgeInsets.only(
                  right: 210,
                  top: 15.0,
                ),
                child: Text(
                  'รูปแบบการชงของทางร้าน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffb98068),
                    fontSize: 15.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: Container(
                  height: 160.0,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffb98068),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                              ),
                              child: Ink.image(
                                height: 100.0,
                                width: 120.0,
                                image: AssetImage(
                                  'assets/images/mcoffee1.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            //Checkbox
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 120,
                                left: 70,
                              ),
                              child: Checkbox(
                                onChanged: (data) {
                                  setState(() {
                                    isChecked0 = data!;
                                    if (data == false) {
                                      txType0.text = '';
                                    }
                                  });
                                },
                                value: isChecked0,
                                activeColor: Color(0xffb98068),
                                checkColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xffb98068),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffb98068),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                              ),
                              child: Ink.image(
                                height: 100.0,
                                width: 120.0,
                                image: AssetImage(
                                  'assets/images/mcoffee2.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            //Checkbox
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 120,
                                left: 70,
                              ),
                              child: Checkbox(
                                onChanged: (data) {
                                  setState(() {
                                    isChecked1 = data!;
                                    if (data == false) {
                                      txType0.text = '';
                                    }
                                  });
                                },
                                value: isChecked1,
                                activeColor: Color(0xffb98068),
                                checkColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xffb98068),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffb98068),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                              ),
                              child: Ink.image(
                                height: 100.0,
                                width: 120.0,
                                image: AssetImage(
                                  'assets/images/mcoffee3.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            //Checkbox
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 120,
                                left: 70,
                              ),
                              child: Checkbox(
                                onChanged: (data) {
                                  setState(() {
                                    isChecked2 = data!;
                                    if (data == false) {
                                      txType2.text = '';
                                    }
                                  });
                                },
                                value: isChecked2,
                                activeColor: Color(0xffb98068),
                                checkColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xffb98068),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffb98068),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                              ),
                              child: Ink.image(
                                height: 100.0,
                                width: 120.0,
                                image: AssetImage(
                                  'assets/images/mcoffee4.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            //Checkbox
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 120,
                                left: 70,
                              ),
                              child: Checkbox(
                                onChanged: (data) {
                                  setState(() {
                                    isChecked3 = data!;
                                    if (data == false) {
                                      txType3.text = '';
                                    }
                                  });
                                },
                                value: isChecked3,
                                activeColor: Color(0xffb98068),
                                checkColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xffb98068),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Menu signature
              Padding(
                padding: const EdgeInsets.only(
                  right: 280.0,
                  top: 25.0,
                ),
                child: Text(
                  'Menu Signature',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffb98068),
                  ),
                ),
              ), //ปุ่มเพิ่มรูป Menu Signature
              //ปุ่มเพิ่มรูป Menu Signature
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 0,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimageMenu1 == null
                                  ? Image.asset(
                                      'assets/images/pro1.png',
                                      width: 120.0,
                                      height: 100.0,
                                      // height: 192.0,
                                      // width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimageMenu1!.path),
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
                                  selectImgFromGallery('editimageMenu1');
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimageMenu2 == null
                                  ? Image.asset(
                                      'assets/images/pro2.png',
                                      width: 120.0,
                                      height: 100.0,
                                      // height: 192.0,
                                      // width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimageMenu2!.path),
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
                                  selectImgFromGallery('editimageMenu2');
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimageMenu3 == null
                                  ? Image.asset(
                                      'assets/images/pro3.png',
                                      width: 120.0,
                                      height: 100.0,
                                      // height: 192.0,
                                      // width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimageMenu3!.path),
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
                                  selectImgFromGallery('editimageMenu3');
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimageMenu4 == null
                                  ? Image.asset(
                                      'assets/images/pro4.png',
                                      width: 120.0,
                                      height: 100.0,
                                      // height: 192.0,
                                      // width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimageMenu4!.path),
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
                                  selectImgFromGallery('editimageMenu4');
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.0,
                              ),
                              child: editimageMenu5 == null
                                  ? Image.asset(
                                      'assets/images/pro2.png',
                                      width: 120.0,
                                      height: 100.0,
                                      // height: 192.0,
                                      // width: 340.0,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(editimageMenu5!.path),
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
                                  selectImgFromGallery('editimageMenu5');
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
//detail
              Padding(
                padding: const EdgeInsets.only(
                  right: 290.0,
                  top: 10.0,
                ),
                child: Text(
                  'ข้อมูลร้าน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffb98068),
                    fontSize: 15.0,
                  ),
                ),
              ),
              //Map
              Padding(
                padding: const EdgeInsets.only(
                  right: 320.0,
                  top: 10.0,
                ),
                child: Text(
                  'Map',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              //ช่องใส่ Shop Location
              // Container(
              //     width: 350,
              //     height: 80,
              //     decoration: BoxDecoration(
              //         border: Border(
              //             bottom: BorderSide(
              //       color: Colors.grey,
              //       width: 1,
              //     ))),
              //     child: Row(children: [
              //       Expanded(
              //           child: TextButton(
              //               onPressed: () {
              //           Navigator.push(
              // context,
              // MaterialPageRoute(
              //   builder: (context) => EditLocationUI(),
              // ),
              //         );
              //               },
              //               child: Padding(
              //                   padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              //                   child: Align(
              //                       alignment: Alignment.topLeft,
              //                       child: Text(
              //                         user.gmap,
              //                         style: TextStyle(
              //                           fontSize: 16,
              //                           height: 1.4,
              //                         ),
              //                       ))))),
              //       Icon(
              //         Icons.keyboard_arrow_right,
              //         color: Colors.grey,
              //         size: 40.0,
              //       )
              //     ])),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 40.0,
                  top: 1.0,
                ),
                child: SizedBox(
                  height: 65.0,
                
                  child: TextField(
                    onTap: () {
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //   builder: (context) => EditLocationUI(),
                      // )
                      // );

                      //setState(() => gmap = txLocation.text);
                    },
                    // enabled: false,
                    controller: txLocation,
                    decoration: InputDecoration(
                      //border: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(0),
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
                      prefixIcon: Icon(
                        Icons.map_outlined,
                        color: Color(0xffb98068),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.save_as_outlined),
                        color: Color(0xffb98068),
                        onPressed: () {
                          _onChanged(String value) {
                            setState(() => _value = 'Change: ${value}');
                          }

                          _onSubmit(String value) {
                            setState(() => _value = 'Submit: ${value}');
                          }
                        },
                      ),
                      hintText: 'Shop Location(GoogleMap Link)',
                      hintStyle: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
              ),
              //end Map
              //address
              Padding(
                padding: const EdgeInsets.only(
                  right: 300.0,
                  top: 10.0,
                ),
                child: Text(
                  'Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              //Provice
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
                          prefixIcon: Icon(
                            Icons.house_outlined,
                            color: Color(0xffb98068),
                          ),
                           suffixIcon: IconButton(
                        icon: Icon(Icons.save_as_outlined),
                        color: Color(0xffb98068),
                        onPressed: () {
                          _onChanged(String value) {
                            setState(() => _value = 'Change: ${value}');
                          }

                          _onSubmit(String value) {
                            setState(() => _value = 'Submit: ${value}');
                          }
                        },
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
                          prefixIcon: Icon(
                            Icons.house_outlined,
                            color: Color(0xffb98068),
                          ),
                           suffixIcon: IconButton(
                        icon: Icon(Icons.save_as_outlined),
                        color: Color(0xffb98068),
                        onPressed: () {
                          _onChanged(String value) {
                            setState(() => _value = 'Change: ${value}');
                          }

                          _onSubmit(String value) {
                            setState(() => _value = 'Submit: ${value}');
                          }
                        },
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

              //ช่่องใส่ Phone and Facebook
              Row(
                children: [
                  //Phone
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
                          prefixIcon: Icon(
                            Icons.phone_iphone_outlined,
                            color: Color(0xffb98068),
                          ),
                           suffixIcon: IconButton(
                        icon: Icon(Icons.save_as_outlined),
                        color: Color(0xffb98068),
                        onPressed: () {
                          _onChanged(String value) {
                            setState(() => _value = 'Change: ${value}');
                          }

                          _onSubmit(String value) {
                            setState(() => _value = 'Submit: ${value}');
                          }
                        },
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
                          prefixIcon: Icon(
                            Icons.facebook_outlined,
                            color: Color(0xffb98068),
                          ),
                           suffixIcon: IconButton(
                        icon: Icon(Icons.save_as_outlined),
                        color: Color(0xffb98068),
                        onPressed: () {
                          _onChanged(String value) {
                            setState(() => _value = 'Change: ${value}');
                          }

                          _onSubmit(String value) {
                            setState(() => _value = 'Submit: ${value}');
                          }
                        },
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
                ],
              ),
              //ปุ่ม Checkbox Detail Shop
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 10,
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
                                setState(() {
                                  isChecked4 = data!;
                                  if (data == false) {
                                    txType4.text = 'txType4';
                                  }
                                });
                              },
                              value: isChecked4,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                FontAwesomeIcons.car,
                                color: Color(0xffb98068),
                                size: 20,
                              ),
                            ),
                            //Checkbox wifi
                            Checkbox(
                              onChanged: (data) {
                                setState(() {
                                  isChecked5 = data!;
                                  if (data == false) {
                                    txType5.text = 'txType5';
                                  }
                                });
                              },
                              value: isChecked5,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                FontAwesomeIcons.wifi,
                                color: Color(0xffb98068),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
          
                 //เริ่ม ปุ่มออกจากระบบ
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 20,
              ),
              child: SizedBox(
                width: 260,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainMenuUI(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.save_as_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Save',
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
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
