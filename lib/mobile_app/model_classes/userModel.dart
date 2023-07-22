import 'dart:convert';

import 'package:ecommerece/mobile_app/model_classes/static_value.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? status;
  String? tockenId;
  String? uid;
  String? address;
  String? number;
  String? profileImage;
  UserModel({
    this.name,
    this.email,
    this.password,
    this.status,
    this.tockenId,
    this.uid,
    this.address,
    this.number,
    this.profileImage,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? status,
    String? tockenId,
    String? uid,
    String? address,
    String? number,
    String? profileImage,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      tockenId: tockenId ?? this.tockenId,
      uid: uid ?? this.uid,
      address: address ?? this.address,
      number: number ?? this.number,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (tockenId != null) {
      result.addAll({'tockenId': tockenId});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (number != null) {
      result.addAll({'number': number});
    }
    if (profileImage != null) {
      result.addAll({'profileImage': profileImage});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      status: map['status'],
      tockenId: map['tockenId'],
      uid: map['uid'],
      address: map['address'],
      number: map['number'],
      profileImage: map['profileImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password, status: $status, tockenId: $tockenId, uid: $uid, address: $address, number: $number, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.status == status &&
        other.tockenId == tockenId &&
        other.uid == uid &&
        other.address == address &&
        other.number == number &&
        other.profileImage == profileImage;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        status.hashCode ^
        tockenId.hashCode ^
        uid.hashCode ^
        address.hashCode ^
        number.hashCode ^
        profileImage.hashCode;
  }
}
