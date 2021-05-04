import 'package:flutter/cupertino.dart';

class UserModel {
  final String imageUrl;
  final String name;

  UserModel({
    @required this.imageUrl,
    @required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
      'name': this.name,
    };
  }


}
