import 'package:flutter/material.dart';
import 'package:shop_paicill_app/views/accountpage_ui.dart';
import 'package:shop_paicill_app/views/editshop_ui.dart';
import 'package:shop_paicill_app/views/feedback_ui.dart';
import 'package:shop_paicill_app/views/homemenu_ui.dart';
import 'package:shop_paicill_app/views/loginpage_ui.dart';
import 'package:shop_paicill_app/views/mainmenu_ui.dart';
import 'package:shop_paicill_app/views/registerpage_ui.dart';
import 'package:shop_paicill_app/views/setting_ui.dart';
import 'package:shop_paicill_app/views/splashscreen_ui.dart';
import 'package:shop_paicill_app/views/tester_ui.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      
    ),
    
  );
}
