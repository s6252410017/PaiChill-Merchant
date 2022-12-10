import 'package:flutter/material.dart';


class ListId {
  String name = '';
  //String sex = '';
  //String birthdate = '';
  String email = '';
  String password = '';
  String image = '';
  String gmap = '';
  String district = '';
  String province = '';
  String phonenum = '';
  String facebook = '';
  //List favorite = [];
  //String promotion = '';
  //List latlng = [];

  ListId({
    required this.name,
    //required this.sex,
    //required this.birthdate,
    required this.email,
    required this.password,
    required this.image,
    required this.gmap,
    required this.district,
    required this.province,
    required this.phonenum,
    required this.facebook,
    //required this.favorite,
    //required this.promotion,
    //required this.latlng,
  });
  ListId copy({
    String? imagePath,
    String? name,
     String? email,
    String? password,
    String? gmap,
    String? district,
    String? province,
    String? phonenum,
    String? facebook,
   
    String? about,
  }) =>
      ListId(
        image: imagePath ?? this.image,
        name: name ?? this.name,
        password: password ?? this.password,
        email: email ?? this.email,
        gmap: gmap ?? this.gmap,
        district: district ?? this.district,
        province: province ?? this.province,
        phonenum: phonenum ?? this.phonenum,
        facebook: facebook ?? this.facebook,
      );

  static ListId fromJson(Map<String, dynamic> json) => ListId(
        image: json['imagePath'],
        name: json['name'],
        password: json['password'],
        email: json['email'],
       gmap: json['gmap'],
       district: json['district'],
        province: json['province'],
        phonenum:json['phonenum'],
        facebook: json['facebook'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': image,
        'name': name,
        'email': email,
        'gmap': gmap,
        'district': district,
        'province': province,
        'phonenum': phonenum,
        'facebook': facebook,
      };
}
