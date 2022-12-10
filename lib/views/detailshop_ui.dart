import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_paicill_app/views/viewfeedback_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/src/intl/date_format.dart';

import '../services/google_services.dart';

class DetailShopUI extends StatefulWidget {
  String docId = ' ';
  DetailShopUI({
    Key? key,
    required this.docId,
  }) : super(key: key);

  @override
  State<DetailShopUI> createState() => _DetailShopUIState();
}

class _DetailShopUIState extends State<DetailShopUI> {
  TextEditingController txAddress = TextEditingController();
  TextEditingController txDistrict = TextEditingController();
  TextEditingController showWi = TextEditingController();
  TextEditingController showCar = TextEditingController();
  TextEditingController txComment = TextEditingController();
  late LocationData cerrenPosition;
  late GoogleMapController mapController;
  Location location = Location();
  LatLng initialcameraposition = LatLng(0, 0);
  Set<Marker> _markers = {};
  late DocumentSnapshot feedbackData;
  bool favorite = false;
  String userName = ' ';
  String userMail = ' ';

  double _currentSliderValue = 0;

  String? get docId => (' ');

  //mapmarker
  void _onMapCreated(mapController) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('sau1'),
        position: initialcameraposition,
      ));
    });
  }

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

  // @override
  // void initState() {
  //   GoogleServices().getsubcollections();
  //   getUser();
  //   super.initState();
  // }

  // getUser() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   userMail = sp.getString('email')!;
  //   userName = sp.getString('name')!;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection("shop_account")
            .doc(docId)
            .get( ),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          Map<String, dynamic> shopData =
              snapshot.data!.data() as Map<String, dynamic>;

          txAddress.text = shopData['detailshop']['province'] +
              '/' +
              shopData['detailshop']['district'];
          showWi.text = shopData['detailshop']['wifi'];
          showCar.text = shopData['detailshop']['carpark'];
          initialcameraposition = LatLng(
              double.parse(shopData['shoplocation']['lat']),
              double.parse(shopData['shoplocation']['lng']));
          List count = shopData['favorite'];

          for (var i = 0; count.length > i; i++) {
            if (count[i] == userMail) {
              favorite = true;
              break;
            }
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Card(
                      child: Stack(
                        children: [
                          Ink.image(
                            height: 192.0,
                            width: MediaQuery.of(context).size.width,
                            image: NetworkImage(
                              shopData['imagehead'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    //view
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 228,
                        top: 15.0,
                      ),
                      child: Text(
                        'บรรยากาศภายในร้าน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: Container(
                        height: 200.0,
                        child: ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Ink.image(
                                    height: 192.0,
                                    width: 340.0,
                                    image: NetworkImage(
                                      shopData['imagepreview']['imagepre1'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Ink.image(
                                    height: 192.0,
                                    width: 340.0,
                                    image: NetworkImage(
                                      shopData['imagepreview']['imagepre2'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Ink.image(
                                    height: 192.0,
                                    width: 340.0,
                                    image: NetworkImage(
                                      shopData['imagepreview']['imagepre3'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Ink.image(
                                    height: 192.0,
                                    width: 340.0,
                                    image: NetworkImage(
                                      shopData['imagepreview']['imagepre4'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //coffeetype
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 210,
                        top: 15.0,
                      ),
                      child: Text(
                        'รูปแบบการชงของทางร้าน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
                            shopData['coffeetype']['default'] == '1'
                                ? Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
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
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    width: 0.1,
                                  ),
                            shopData['coffeetype']['mokapot'] == '1'
                                ? Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
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
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    width: 0.1,
                                  ),
                            shopData['coffeetype']['drip'] == '1'
                                ? Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
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
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    width: 0.1,
                                  ),
                            shopData['coffeetype']['syphon'] == '1'
                                ? Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
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
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    width: 0.1,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    //signature
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 250.0,
                        top: 25.0,
                      ),
                      child: Text(
                        'Menu Signature',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: Container(
                        height: 200.0,
                        child: ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Column(
                                    children: [
                                      Ink.image(
                                        height: 192.0,
                                        width: 150.0,
                                        image: NetworkImage(
                                          shopData['imagemenu']['imagemenu1'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Column(
                                    children: [
                                      Ink.image(
                                        height: 192.0,
                                        width: 150.0,
                                        image: NetworkImage(
                                          shopData['imagemenu']['imagemenu2'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Column(
                                    children: [
                                      Ink.image(
                                        height: 192.0,
                                        width: 150.0,
                                        image: NetworkImage(
                                          shopData['imagemenu']['imagemenu3'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Column(
                                    children: [
                                      Ink.image(
                                        height: 192.0,
                                        width: 150.0,
                                        image: NetworkImage(
                                          shopData['imagemenu']['imagemenu4'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Column(
                                    children: [
                                      Ink.image(
                                        height: 192.0,
                                        width: 150.0,
                                        image: NetworkImage(
                                          shopData['imagemenu']['imagemenu5'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //detail
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 240,
                          height: 35,
                          child: TextField(
                            controller: txAddress,
                            readOnly: true,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.home,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 85,
                          height: 35,
                          child: shopData['detailshop']['wifi'] == '1'
                              ? TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5.0,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.wifi,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                  ),
                                )
                              : TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5.0,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.wifi,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.xmark,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _makePhoneCall(
                                  shopData['detailshop']['phonenum']);
                            });
                          },
                          icon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          label: Text(
                            shopData['detailshop']['phonenum'],
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 85,
                          height: 35,
                          child: shopData['detailshop']['carpark'] == '1'
                              ? TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5.0,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.car,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                  ),
                                )
                              : TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5.0,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.car,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                    suffixIcon: Icon(
                                      FontAwesomeIcons.xmark,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          late Uri url =
                              Uri.parse(shopData['detailshop']['facebook']);
                          launchUrl(url);
                        },
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.black,
                        ),
                        label: Text(
                          shopData['detailshop']['name'],
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //map
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                      ),
                      child: Container(
                        height: 300.0,
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: initialcameraposition,
                            zoom: 16,
                          ),
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          markers: _markers,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          late Uri url =
                              Uri.parse(shopData['detailshop']['map']);
                          launchUrl(url);
                        },
                        icon: Icon(
                          Icons.location_pin,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Let Go!!',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),

                    //feedback
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     right: 285.0,
                    //     top: 30.0,
                    //   ),
                    //   child: Text(
                    //     'Feedback',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: 10.0,
                    //     right: 10.0,
                    //     top: 15.0,
                    //   ),
                    //   child: TextField(
                    //     controller: txComment,
                    //     keyboardType: TextInputType.multiline,
                    //     maxLines: 4,
                    //     decoration: InputDecoration(
                    //       hintText: "Enter Comment..",
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           width: 1.0,
                    //           color: Colors.black54,
                    //         ),
                    //         borderRadius: BorderRadius.circular(
                    //           6.0,
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           width: 2,
                    //           color: Colors.black87,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     top: 20.0,
                    //   ),
                    //   child: RatingBarIndicator(
                    //     rating: _currentSliderValue,
                    //     itemCount: 5,
                    //     itemSize: 30.0,
                    //     physics: BouncingScrollPhysics(),
                    //     itemBuilder: (context, _) => Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: 60.0,
                    //     right: 60.0,
                    //   ),
                    //   child: Slider(
                    //     value: _currentSliderValue,
                    //     max: 5,
                    //     divisions: 5,
                    //     label: _currentSliderValue.round().toString(),
                    //     onChanged: (double value) {
                    //       setState(() {
                    //         _currentSliderValue = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: 60.0,
                    //     right: 60.0,
                    //   ),
                    //   child: FutureBuilder(
                    //       future: Firebase.initializeApp(),
                    //       builder: (context, snapshot) {
                    //         return ElevatedButton(
                    //           onPressed: () async {
                    //             String score = _currentSliderValue.toString();

                    //             CollectionReference addFeedback =
                    //                 FirebaseFirestore.instance
                    //                     .collection("feedback");
                    //             String datenow = DateFormat('yyyy-MM-dd')
                    //                 .format(DateTime.now());
                    //             try {
                    //               await addFeedback.add({
                    //                 "comment": txComment.text,
                    //                 "date": datenow,
                    //                 'name': userName,
                    //                 'score': score,
                    //                 'shopid': widget.docId,
                    //               });
                    //               Navigator.pushReplacement(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (BuildContext context) =>
                    //                           super.widget));
                    //             } on FirebaseException catch (e) {
                    //               print(e);
                    //             }
                    //           },
                    //           child: Text(
                    //             'Submit',
                    //             style: TextStyle(
                    //               fontFamily: 'Kanit',
                    //               color: Colors.black54,
                    //               fontSize: 15.0,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           style: ElevatedButton.styleFrom(
                    //             elevation: 10.0,
                    //             fixedSize: Size(
                    //                 MediaQuery.of(context).size.width - 301.0,
                    //                 29.0),
                    //             primary: Color.fromARGB(255, 112, 221, 116),
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(10.0),
                    //             ),
                    //           ),
                    //         );
                    //       }),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Divider(
                        height: 25.0,
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewFeedbackUI(
                              docId: widget.docId,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.pages,
                        color: Colors.black,
                      ),
                      label: Text(
                        'View Feedback On Click!!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(221, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    top: 5.0,
                  ),
                  child: FavoriteButton(
                    iconSize: 40.0,
                    isFavorite: favorite,
                    valueChanged: (favorite) async {
                      DocumentReference docRef = await FirebaseFirestore
                          .instance
                          .collection('shop_account')
                          .doc(widget.docId);
                      for (var i = 0; count.length > i; i++) {
                        if (favorite == false) {
                          await docRef.update(
                            {
                              'favorite': FieldValue.arrayRemove([userMail])
                            },
                          );
                        } else if (favorite == true) {
                          await docRef.update(
                            {
                              'favorite': FieldValue.arrayUnion([userMail])
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
