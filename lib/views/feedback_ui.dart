import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shop_paicill_app/views/mainmenu_ui.dart';



class FeedBackUI extends StatefulWidget {
  const FeedBackUI({Key? key, required String docId}) : super(key: key);

  @override
  State<FeedBackUI> createState() => _FeedBackUIState();
}

class _FeedBackUIState extends State<FeedBackUI> {
  late LocationData cerrenPosition;
  late GoogleMapController mapController;
  Location location = Location();
  LatLng initialcameraposition = LatLng(13.707491037300096, 100.35616450859982);
  Set<Marker> _markers = {};

  

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios, 
            color: Color(0xffb98068)
            ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Feedback",
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
              Padding(
                padding: const EdgeInsets.only(
                  right: 285.0,
                  top: 30.0,
                ),
                child: Text(
                  'Feedback',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 15.0,
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Enter Comment..",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: RatingBarIndicator(
                  rating: _currentSliderValue,
                  itemCount: 5,
                  itemSize: 30.0,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 60.0,
                  right: 60.0,
                ),
                child: Slider(
                  value: _currentSliderValue,
                  max: 5,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 60.0,
                  right: 60.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainMenuUI(),
                      ),
                    );
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    fixedSize:
                        Size(MediaQuery.of(context).size.width - 301.0, 29.0),
                    primary: Color(0xffb98068),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
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
              Container(
                height: 150.0,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xffb98068),                 
                      
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 60.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'User1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(
                              width: 185.0,
                            ),
                            Container(
                              width: 100.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '22-05-2022',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 25.0,
                        thickness: 1,
                        color: Color(0xffb98068),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.0,
                            ),
                            Container(
                              width: 330.0,
                              height: 40.0,
                              child: Text(
                                'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 360.0,
                        height: 35.0,
                        alignment: Alignment.bottomCenter,
                        child: RatingBarIndicator(
                          rating: 5,
                          itemCount: 5,
                          itemSize: 20.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //User2
              Container(
                height: 150.0,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xffb98068),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 60.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'User2',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(
                              width: 185.0,
                            ),
                            Container(
                              width: 100.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '22-05-2022',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 25.0,
                        thickness: 1,
                        color: Color(0xffb98068),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.0,
                            ),
                            Container(
                              width: 330.0,
                              height: 40.0,
                              child: Text(
                                'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 360.0,
                        height: 35.0,
                        alignment: Alignment.bottomCenter,
                        child: RatingBarIndicator(
                          rating: 5,
                          itemCount: 5,
                          itemSize: 20.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //User3
              Container(
                height: 150.0,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xffb98068),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 60.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'User3',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(
                              width: 185.0,
                            ),
                            Container(
                              width: 100.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '22-05-2022',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 25.0,
                        thickness: 1,
                        color: Color(0xffb98068),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.0,
                            ),
                            Container(
                              width: 330.0,
                              height: 40.0,
                              child: Text(
                                'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 360.0,
                        height: 35.0,
                        alignment: Alignment.bottomCenter,
                        child: RatingBarIndicator(
                          rating: 5,
                          itemCount: 5,
                          itemSize: 20.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //User4
              Container(
                height: 150.0,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xffb98068),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 60.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'User4',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            SizedBox(
                              width: 185.0,
                            ),
                            Container(
                              width: 100.0,
                              height: 30.0,
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '22-05-2022',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 25.0,
                        thickness: 1,
                        color: Color(0xffb98068),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.0,
                            ),
                            Container(
                              width: 330.0,
                              height: 40.0,
                              child: Text(
                                'ร้านบริการดี พนักงานยิ้มแย้มเอาใจใส่ พูดจาสุภาพ แต่งกายสะอาดดีอาหารอร่อย',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 360.0,
                        height: 35.0,
                        alignment: Alignment.bottomCenter,
                        child: RatingBarIndicator(
                          rating: 5,
                          itemCount: 5,
                          itemSize: 20.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
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
    );
  }
}
