import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailShop1UI extends StatefulWidget {
  const DetailShop1UI({Key? key}) : super(key: key);

  @override
  State<DetailShop1UI> createState() => _DetailShop1UIState();
}

class _DetailShop1UIState extends State<DetailShop1UI> {
  late LocationData cerrenPosition;
  late GoogleMapController mapController;
  Location location = Location();
  LatLng initialcameraposition = LatLng(13.707491037300096, 100.35616450859982);
  Set<Marker> _markers = {};

  String facebook = "https://www.facebook.com/turtleapisit";
  String amazon = "https://www.facebook.com/cafeamazonofficial";
  String map = "https://goo.gl/maps/EF3dpTnMVEvjtQAEA";

  double _currentSliderValue = 0;

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
          "Detail",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xffb98068)),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              top: 5.0,
            ),
            child: FavoriteButton(
              iconColor: Color(0xffb98068),
              iconSize: 40.0,
              isFavorite: true,
              valueChanged: (_isFavorite) {
                print('Is Favorite : $_isFavorite');
              },
            ),
          ),
        ],
      ),
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
                      image: AssetImage(
                        'assets/images/IMGshop.jpg',
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
                              image: AssetImage(
                                'assets/images/Shop.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      //รูป2
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
                              image: AssetImage(
                                'assets/images/Shop.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      //รูป3
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
                              image: AssetImage(
                                'assets/images/Shop.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      //รูป4
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
                              image: AssetImage(
                                'assets/images/Shop.png',
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
              //mcoffee
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
                                  height: 190.0,
                                  width: 150.0,
                                  image: AssetImage(
                                    'assets/images/pro1.png',
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
                                  height: 190.0,
                                  width: 150.0,
                                  image: AssetImage(
                                    'assets/images/pro2.png',
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
                                  height: 190.0,
                                  width: 150.0,
                                  image: AssetImage(
                                    'assets/images/pro3.png',
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
                                  height: 190.0,
                                  width: 150.0,
                                  image: AssetImage(
                                    'assets/images/pro4.png',
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
                                  height: 190.0,
                                  width: 150.0,
                                  image: AssetImage(
                                    'assets/images/pro1.png',
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
              Padding(
                padding: const EdgeInsets.only(
                  right: 290.0,
                  top: 10.0,
                ),
                child: Text(
                  'ข้อมูลร้าน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 55.0,
                      ),
                      child: Icon(
                        Icons.map,
                        size: 20.0,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 10,
                          ),
                          child: Container(
                            width: 150.0,
                            alignment: Alignment.bottomLeft,
                            child: GestureDetector(
                              onTap: () {
                                late Uri url = Uri.parse(map);
                                launchUrl(url);
                              },
                              child: Text(
                                'PaiChillCoffee',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //end Map
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Container(
                        width: 96.0,
                        height: 120.0,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 35.0,
                              ),
                              child: Icon(
                                Icons.phone,
                                size: 20.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 35,
                              ),
                              child: Icon(
                                Icons.facebook,
                                size: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 160.0,
                        height: 120.0,
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                width: 150.0,
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Bk/BangKhae',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24,
                              ),
                              child: Container(
                                width: 150.0,
                                alignment: Alignment.bottomLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _makePhoneCall('0964478767');
                                    });
                                  },
                                  child: Text(
                                    '0964478767',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24,
                              ),
                              child: Container(
                                width: 150.0,
                                alignment: Alignment.bottomLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    late Uri url = Uri.parse(amazon);
                                    launchUrl(url);
                                  },
                                  child: Text(
                                    'PaiChillCoffee',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 57.0,
                        height: 120.0,
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                width: 150.0,
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Wifi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24,
                              ),
                              child: Container(
                                width: 150.0,
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Carpark',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 57.0,
                        height: 120.0,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                width: 150.0,
                                alignment: Alignment.bottomCenter,
                                child: Icon(
                                  Icons.check,
                                  size: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24,
                              ),
                              child: Container(
                                width: 150.0,
                                alignment: Alignment.bottomCenter,
                                child: Icon(
                                  Icons.check,
                                  size: 17,
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
              // //map
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 5.0,
              //   ),
              //   child: Container(
              //     height: 300.0,
              //     width: MediaQuery.of(context).size.width,
              //     child: GoogleMap(
              //       initialCameraPosition: CameraPosition(
              //         target: initialcameraposition,
              //         zoom: 16,
              //       ),
              //       mapType: MapType.normal,
              //       onMapCreated: _onMapCreated,
              //       markers: _markers,
              //     ),
              //   ),
              // ),
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
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => DetailShopUI(),
              //         ),
              //       );
              //     },
              //     child: Text(
              //       'Submit',
              //       style: TextStyle(
              //         fontFamily: 'Kanit',
              //         color: Colors.black54,
              //         fontSize: 15.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       elevation: 10.0,
              //       fixedSize:
              //           Size(MediaQuery.of(context).size.width - 301.0, 29.0),
              //       primary: Color.fromARGB(255, 245, 169, 87),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 20.0,
              //   ),
              //   child: Divider(
              //     height: 25.0,
              //     thickness: 1,
              //     indent: 15,
              //     endIndent: 15,
              //     color: Colors.black38,
              //   ),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // Container(
              //   height: 150.0,
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     elevation: 5,
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         color: Colors.black,
              //       ),
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(12),
              //       ),
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 10.0,
              //               ),
              //               Container(
              //                 width: 60.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   'User1',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 185.0,
              //               ),
              //               Container(
              //                 width: 100.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   '22-05-2022',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Divider(
              //           height: 25.0,
              //           thickness: 1,
              //           color: Colors.black,
              //         ),
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 30.0,
              //               ),
              //               Container(
              //                 width: 330.0,
              //                 height: 40.0,
              //                 child: Text(
              //                   'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           width: 360.0,
              //           height: 35.0,
              //           alignment: Alignment.bottomCenter,
              //           child: RatingBarIndicator(
              //             rating: 5,
              //             itemCount: 5,
              //             itemSize: 20.0,
              //             physics: BouncingScrollPhysics(),
              //             itemBuilder: (context, _) => Icon(
              //               Icons.star,
              //               color: Colors.amber,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 150.0,
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     elevation: 5,
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         color: Colors.black,
              //       ),
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(12),
              //       ),
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 10.0,
              //               ),
              //               Container(
              //                 width: 60.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   'User1',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 185.0,
              //               ),
              //               Container(
              //                 width: 100.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   '22-05-2022',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Divider(
              //           height: 25.0,
              //           thickness: 1,
              //           color: Colors.black,
              //         ),
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 30.0,
              //               ),
              //               Container(
              //                 width: 330.0,
              //                 height: 40.0,
              //                 child: Text(
              //                   'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           width: 360.0,
              //           height: 35.0,
              //           alignment: Alignment.bottomCenter,
              //           child: RatingBarIndicator(
              //             rating: 5,
              //             itemCount: 5,
              //             itemSize: 20.0,
              //             physics: BouncingScrollPhysics(),
              //             itemBuilder: (context, _) => Icon(
              //               Icons.star,
              //               color: Colors.amber,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 150.0,
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     elevation: 5,
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         color: Colors.black,
              //       ),
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(12),
              //       ),
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 10.0,
              //               ),
              //               Container(
              //                 width: 60.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   'User1',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 185.0,
              //               ),
              //               Container(
              //                 width: 100.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   '22-05-2022',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Divider(
              //           height: 25.0,
              //           thickness: 1,
              //           color: Colors.black,
              //         ),
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 30.0,
              //               ),
              //               Container(
              //                 width: 330.0,
              //                 height: 40.0,
              //                 child: Text(
              //                   'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           width: 360.0,
              //           height: 35.0,
              //           alignment: Alignment.bottomCenter,
              //           child: RatingBarIndicator(
              //             rating: 5,
              //             itemCount: 5,
              //             itemSize: 20.0,
              //             physics: BouncingScrollPhysics(),
              //             itemBuilder: (context, _) => Icon(
              //               Icons.star,
              //               color: Colors.amber,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 150.0,
              //   child: Card(
              //     clipBehavior: Clip.antiAlias,
              //     elevation: 5,
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         color: Colors.black,
              //       ),
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(12),
              //       ),
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 10.0,
              //               ),
              //               Container(
              //                 width: 60.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   'User1',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 185.0,
              //               ),
              //               Container(
              //                 width: 100.0,
              //                 height: 30.0,
              //                 alignment: Alignment.bottomRight,
              //                 child: Text(
              //                   '22-05-2022',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Divider(
              //           height: 25.0,
              //           thickness: 1,
              //           color: Colors.black,
              //         ),
              //         Container(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             children: [
              //               SizedBox(
              //                 width: 30.0,
              //               ),
              //               Container(
              //                 width: 330.0,
              //                 height: 40.0,
              //                 child: Text(
              //                   'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.0),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           width: 360.0,
              //           height: 35.0,
              //           alignment: Alignment.bottomCenter,
              //           child: RatingBarIndicator(
              //             rating: 5,
              //             itemCount: 5,
              //             itemSize: 20.0,
              //             physics: BouncingScrollPhysics(),
              //             itemBuilder: (context, _) => Icon(
              //               Icons.star,
              //               color: Colors.amber,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
