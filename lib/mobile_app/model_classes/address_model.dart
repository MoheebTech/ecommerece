import 'dart:convert';

import 'package:flutter/foundation.dart';

class AddressModel {
  String? uid;
  String? name;
  String? address;
  String? email;
  String? number;
  List<dynamic>? profileImage;
  AddressModel({
    this.uid,
    this.name,
    this.address,
    this.email,
    this.number,
    this.profileImage,
  });

  AddressModel copyWith({
    String? uid,
    String? name,
    String? address,
    String? email,
    String? number,
    List<dynamic>? profileImage,
  }) {
    return AddressModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      number: number ?? this.number,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(uid != null){
      result.addAll({'uid': uid});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(address != null){
      result.addAll({'address': address});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(number != null){
      result.addAll({'number': number});
    }
    if(profileImage != null){
      result.addAll({'profileImage': profileImage});
    }
  
    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      uid: map['uid'],
      name: map['name'],
      address: map['address'],
      email: map['email'],
      number: map['number'],
      profileImage: List<dynamic>.from(map['profileImage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(uid: $uid, name: $name, address: $address, email: $email, number: $number, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AddressModel &&
      other.uid == uid &&
      other.name == name &&
      other.address == address &&
      other.email == email &&
      other.number == number &&
      listEquals(other.profileImage, profileImage);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      name.hashCode ^
      address.hashCode ^
      email.hashCode ^
      number.hashCode ^
      profileImage.hashCode;
  }
}
