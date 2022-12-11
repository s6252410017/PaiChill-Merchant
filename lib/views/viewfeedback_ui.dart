

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ViewFeedbackUI extends StatefulWidget {
  String docId = '';
  ViewFeedbackUI({
    Key? key,
    required this.docId,
  }) : super(key: key);

  @override
  State<ViewFeedbackUI> createState() => _ViewFeedbackUIState();
}

class _ViewFeedbackUIState extends State<ViewFeedbackUI> {
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
          "Feedback",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xffb98068)),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("feedback").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                
              ),
            );
          }
          //print('+++++++++++++++++++${snapshot}');

          return ListView.builder(
              //   itemCount: snapshot.data!.docs.map((Document){
              itemBuilder: (context, index) {
            final DocumentSnapshot documentSnapshot =
                snapshot.data!.docs[index];
            //     return SingleChildScrollView(
            //       child: Column(
            //         children: [
            //         ],
            //       ),
            //     );
            // //  }).toList(),
            //   });

            children:
            snapshot.data!.docs.map((Document) {
              return SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  documentSnapshot["shopid"] == widget.docId
                      ? Container(
                          height: 170.0,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
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
                                        width: 190.0,
                                        height: 30.0,
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          documentSnapshot["name"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 90.0,
                                      ),
                                      Container(
                                        width: 100.0,
                                        height: 30.0,
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          documentSnapshot["date"],
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
                                  color: Colors.black,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 35.0,
                                      ),
                                      Container(
                                        width: 340.0,
                                        height: 40.0,
                                        child: Text(
                                          documentSnapshot["comment"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40.0,
                                  alignment: Alignment.bottomCenter,
                                  child: RatingBarIndicator(
                                    rating:
                                        double.parse(documentSnapshot["score"]),
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
                        )
                      : SizedBox(
                          width: 0.1,
                        ),
                ]),
              );
            }).toList();
          });
        },
      ),
    );
  }
}
