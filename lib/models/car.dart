import 'dart:ui';
import 'package:flutter/material.dart';

class Car {

  String? id;
  String? number;
  String? type;
  String? description;
  String? owner_id;

  Car({
      this.id,
      this.number,
      this.type,
      this.description,
      this.owner_id,
      });

  Car.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    number = json['number'];
    type = json['type'];
    description = json['description'];
    owner_id = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['type'] = this.type;
    data['description'] = this.description;
    data['owner_id'] = this.owner_id;
    return data;
  }
}