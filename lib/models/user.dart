import 'dart:ui';
import 'package:flutter/material.dart';
import '/models/car.dart';

class User {
  String? id;
  String?  name;
  String?  email;
  String?  address;
  String?  password;
  String?  photo;
  String?  phone;
  String?  role;
  List<Car>? cars;

  User(
    {
      this.id,
      this.name,
      this.email,
      this.address,
      this.password,
      this.photo,
      this.phone,
      this.role="Client",
      this.cars,
    }
  );

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }

}

