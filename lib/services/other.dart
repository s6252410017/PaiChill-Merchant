import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtherServices {
  //savetoSP
  Future saveDataToSP(txName,txEmail,txDistrict,txProvince,txFacebook,txPhonenum,txLocation) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('name', txName);
    //sp.setString('sex', rdSex);
    //sp.setString('birthDate', formatDate);
    sp.setString('email', txEmail);
    sp.setString('districk', txDistrict);
    sp.setString('province', txProvince);
    sp.setString('facebook', txFacebook);
    sp.setString('phonenum', txPhonenum);
    sp.setString('location', txLocation);
  }

  showWarningDialog(context, msg) {
    Alert(
        context: context,
        title: "Error",
        desc: msg,
        image: Image.asset(
          "assets/images/warning-icon.png",
          width: 150,
        ),
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromARGB(255, 34, 184, 96),
            radius: BorderRadius.circular(5.0),
          ),
        ]).show();
  }
}
