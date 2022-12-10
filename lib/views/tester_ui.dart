// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../models/profile.dart';

// class TesterUI extends StatefulWidget {
//   const TesterUI({Key? key}) : super(key: key);

//   @override
//   State<TesterUI> createState() => _TesterUIState();
// }

// class _TesterUIState extends State<TesterUI> {
//   final formKey = GlobalKey<FormState>();

//   Profile profile = Profile(email: '', password: '');
//   final Future<FirebaseApp> firebase = Firebase.initializeApp();

//   final Future<String> _calculation = Future<String>.delayed(
//     const Duration(seconds: 2),
//     () => 'Data Loaded',
//   );

//   @override
//   Widget build(BuildContext context) {
//     //Pub.Dev
//     // return FutureBuilder<String>(
//     //     future: _calculation, // a previously-obtained Future<String> or null
//     //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//     //       List<Widget> children;
//     //       if (snapshot.hasData) {
//     //         children = <Widget>[
//     //           const Icon(
//     //             Icons.check_circle_outline,
//     //             color: Colors.green,
//     //             size: 60,
//     //           ),
//     //           Padding(
//     //             padding: const EdgeInsets.only(top: 16),
//     //             child: Text('Result: ${snapshot.data}'),
//     //           ),
//     //         ];
//     //       } else if (snapshot.hasError) {
//     //         children = <Widget>[
//     //           const Icon(
//     //             Icons.error_outline,
//     //             color: Colors.red,
//     //             size: 60,
//     //           ),
//     //           Padding(
//     //             padding: const EdgeInsets.only(top: 16),
//     //             child: Text('Error: ${snapshot.error}'),
//     //           ),
//     //         ];
//     //       } else {
//     //         children = const <Widget>[
//     //           SizedBox(
//     //             width: 60,
//     //             height: 60,
//     //             child: CircularProgressIndicator(),
//     //           ),
//     //           Padding(
//     //             padding: EdgeInsets.only(top: 16),
//     //             child: Text('Awaiting result...'),
//     //           ),
//     //         ];
//     //       }
//     //       return Center(
//     //         child: Column(
//     //           mainAxisAlignment: MainAxisAlignment.center,
//     //           children: children,
//     //         ),
//     //       );
//     //     },
//     //   );
//     return FutureBuilder(
//       future: firebase,
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text("Error"),
//             ),
//             body: Center(
//               child: Text("${snapshot.error}"),
//             ),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           //Form สร้างบัญชี
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_ios, color: Color(0xffb98068)),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               title: Text(
//                 "สมัคร",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, color: Color(0xffb98068)),
//               ),
//               centerTitle: true,
//             ),
//             body: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Form(
//                   key: formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("อีเมล", style: TextStyle(fontSize: 20)),
//                         TextFormField(
//                           validator: MultiValidator([
//                             RequiredValidator(
//                                 errorText: "กรุณาป้อนอีเมลด้วยครับ"),
//                             EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
//                           ]),
//                           keyboardType: TextInputType.emailAddress,
//                           // onSaved: (String email) {
//                           //   profile.email = email;
//                           // },
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
//                         TextFormField(
//                           validator: RequiredValidator(
//                               errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
//                           obscureText: true,
//                           onSaved: (password) {
//                             profile.password = password!;
//                           },
//                           // onSaved: (String password) {
//                           //   profile.password = password;
//                           // },
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             child: Text("ลงทะเบียน",
//                                 style: TextStyle(fontSize: 20)),
//                             onPressed: () async {
//                                if (formKey.currentState!.validate()) {
//                                 formKey.currentState!.save();
//                                 FirebaseAuth.instance.createUserWithEmailAndPassword(
//                                   email: email, 
//                                   password: password
//                                   );
//                                 formKey.currentState!.reset();
//                                }

//                               // if (formKey.currentState!.validate()) {
//                               //   formKey.currentState!.save();
//                               //   try {
//                               //     await FirebaseAuth.instance
//                               //         .createUserWithEmailAndPassword(
//                               //             email: profile.email,
//                               //             password: profile.password)
//                               //         .then((value) {
//                               //       formKey.currentState.reset();
//                               //       Fluttertoast.showToast(
//                               //           msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
//                               //           gravity: ToastGravity.TOP);
//                               //       Navigator.pushReplacement(context,
//                               //           MaterialPageRoute(builder: (context) {
//                               //         return HomeScreen();
//                               //       }));
//                               //     });
//                               //   } on FirebaseAuthException catch (e) {
//                               //     print(e.code);
//                               //     String message;
//                               //     if (e.code == 'email-already-in-use') {
//                               //       message =
//                               //           "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
//                               //     } else if (e.code == 'weak-password') {
//                               //       message =
//                               //           "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
//                               //     } else {
//                               //       message = e.message;
//                               //     }
//                               //     Fluttertoast.showToast(
//                               //         msg: message, gravity: ToastGravity.CENTER);
//                               //   }
//                               // }
//                               // print('No space');
//                               //registerFirebase();
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }

//         return Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//     //Form สร้างบัญชี
//     //     return Scaffold(
//     //       backgroundColor: Colors.white,
//     //       appBar: AppBar(
//     //         backgroundColor: Colors.white,
//     //         leading: IconButton(
//     //           icon: Icon(Icons.arrow_back_ios, color: Color(0xffb98068)),
//     //           onPressed: () => Navigator.of(context).pop(),
//     //         ),
//     //         title: Text(
//     //           "สมัคร",
//     //           style:
//     //               TextStyle(fontWeight: FontWeight.bold, color: Color(0xffb98068)),
//     //         ),
//     //         centerTitle: true,
//     //       ),
//     //       body: Container(
//     //         child: Padding(
//     //           padding: const EdgeInsets.all(20.0),
//     //           child: Form(
//     //             key: formKey,
//     //             child: SingleChildScrollView(
//     //               child: Column(
//     //                 crossAxisAlignment: CrossAxisAlignment.start,
//     //                 children: [
//     //                   Text("อีเมล", style: TextStyle(fontSize: 20)),
//     //                   TextFormField(
//     //                     validator: MultiValidator([
//     //                       RequiredValidator(errorText: "กรุณาป้อนอีเมลด้วยครับ"),
//     //                       EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
//     //                     ]),
//     //                     keyboardType: TextInputType.emailAddress,
//     //                     // onSaved: (String email) {
//     //                     //   profile.email = email;
//     //                     // },
//     //                   ),
//     //                   SizedBox(
//     //                     height: 15,
//     //                   ),
//     //                   Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
//     //                   TextFormField(
//     //                     validator: RequiredValidator(
//     //                         errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
//     //                     obscureText: true,
//     //                     // onSaved: (String password) {
//     //                     //   profile.password = password;
//     //                     // },
//     //                   ),
//     //                   SizedBox(
//     //                     width: double.infinity,
//     //                     child: ElevatedButton(
//     //                       child: Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
//     //                       onPressed: () async {
//     //                         // if (formKey.currentState!.validate()) {
//     //                         //   formKey.currentState!.save();
//     //                         //   try {
//     //                         //     await FirebaseAuth.instance
//     //                         //         .createUserWithEmailAndPassword(
//     //                         //             email: profile.email,
//     //                         //             password: profile.password)
//     //                         //         .then((value) {
//     //                         //       formKey.currentState.reset();
//     //                         //       Fluttertoast.showToast(
//     //                         //           msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
//     //                         //           gravity: ToastGravity.TOP);
//     //                         //       Navigator.pushReplacement(context,
//     //                         //           MaterialPageRoute(builder: (context) {
//     //                         //         return HomeScreen();
//     //                         //       }));
//     //                         //     });
//     //                         //   } on FirebaseAuthException catch (e) {
//     //                         //     print(e.code);
//     //                         //     String message;
//     //                         //     if (e.code == 'email-already-in-use') {
//     //                         //       message =
//     //                         //           "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
//     //                         //     } else if (e.code == 'weak-password') {
//     //                         //       message =
//     //                         //           "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
//     //                         //     } else {
//     //                         //       message = e.message;
//     //                         //     }
//     //                         //     Fluttertoast.showToast(
//     //                         //         msg: message, gravity: ToastGravity.CENTER);
//     //                         //   }
//     //                         // }
//     //                         // print('No space');
//     //                         //registerFirebase();
//     //                       },
//     //                     ),
//     //                   )
//     //                 ],
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //       ),
//     //     );
//   }
//   // Future<Null>registerFirebase()async{
//   //   await Firebase.initializeApp().then((value) => {
//   //     print('Firebase Initiallize Success')
//   //   });
//   // }
// }
