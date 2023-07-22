import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class OrderModelClas {
  String? id;
  List<dynamic>? image;
  String? customername;
  String? productname;
  // Color color;
  int? quantity;
  int? price;
  String? serialcode;
  String? status;
  String? size;
  String? color;
  String? oid;
  String? details;
  String? phonenumber;
  String? address;
  String? emailaddres;
  String? ordertime;
 String? adminid;
  OrderModelClas({
    this.id,
    this.image,
    this.customername,
    this.productname,
    this.quantity,
    this.price,
    this.serialcode,
    this.status,
    this.size,
    this.color,
    this.oid,
    this.details,
    this.phonenumber,
    this.address,
    this.emailaddres,
    this.ordertime,
    this.adminid,
  });

  OrderModelClas copyWith({
    String? id,
    List<dynamic>? image,
    String? customername,
    String? productname,
    int? quantity,
    int? price,
    String? serialcode,
    String? status,
    String? size,
    String? color,
    String? oid,
    String? details,
    String? phonenumber,
    String? address,
    String? emailaddres,
    String? ordertime,
    String? adminid,
  }) {
    return OrderModelClas(
      id: id ?? this.id,
      image: image ?? this.image,
      customername: customername ?? this.customername,
      productname: productname ?? this.productname,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      serialcode: serialcode ?? this.serialcode,
      status: status ?? this.status,
      size: size ?? this.size,
      color: color ?? this.color,
      oid: oid ?? this.oid,
      details: details ?? this.details,
      phonenumber: phonenumber ?? this.phonenumber,
      address: address ?? this.address,
      emailaddres: emailaddres ?? this.emailaddres,
      ordertime: ordertime ?? this.ordertime,
      adminid: adminid ?? this.adminid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(image != null){
      result.addAll({'image': image});
    }
    if(customername != null){
      result.addAll({'customername': customername});
    }
    if(productname != null){
      result.addAll({'productname': productname});
    }
    if(quantity != null){
      result.addAll({'quantity': quantity});
    }
    if(price != null){
      result.addAll({'price': price});
    }
    if(serialcode != null){
      result.addAll({'serialcode': serialcode});
    }
    if(status != null){
      result.addAll({'status': status});
    }
    if(size != null){
      result.addAll({'size': size});
    }
    if(color != null){
      result.addAll({'color': color});
    }
    if(oid != null){
      result.addAll({'oid': oid});
    }
    if(details != null){
      result.addAll({'details': details});
    }
    if(phonenumber != null){
      result.addAll({'phonenumber': phonenumber});
    }
    if(address != null){
      result.addAll({'address': address});
    }
    if(emailaddres != null){
      result.addAll({'emailaddres': emailaddres});
    }
    if(ordertime != null){
      result.addAll({'ordertime': ordertime});
    }
    if(adminid != null){
      result.addAll({'adminid': adminid});
    }
  
    return result;
  }

  factory OrderModelClas.fromMap(Map<String, dynamic> map) {
    return OrderModelClas(
      id: map['id'],
      image: List<dynamic>.from(map['image']),
      customername: map['customername'],
      productname: map['productname'],
      quantity: map['quantity']?.toInt(),
      price: map['price']?.toInt(),
      serialcode: map['serialcode'],
      status: map['status'],
      size: map['size'],
      color: map['color'],
      oid: map['oid'],
      details: map['details'],
      phonenumber: map['phonenumber'],
      address: map['address'],
      emailaddres: map['emailaddres'],
      ordertime: map['ordertime'],
      adminid: map['adminid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModelClas.fromJson(String source) => OrderModelClas.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModelClas(id: $id, image: $image, customername: $customername, productname: $productname, quantity: $quantity, price: $price, serialcode: $serialcode, status: $status, size: $size, color: $color, oid: $oid, details: $details, phonenumber: $phonenumber, address: $address, emailaddres: $emailaddres, ordertime: $ordertime, adminid: $adminid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderModelClas &&
      other.id == id &&
      listEquals(other.image, image) &&
      other.customername == customername &&
      other.productname == productname &&
      other.quantity == quantity &&
      other.price == price &&
      other.serialcode == serialcode &&
      other.status == status &&
      other.size == size &&
      other.color == color &&
      other.oid == oid &&
      other.details == details &&
      other.phonenumber == phonenumber &&
      other.address == address &&
      other.emailaddres == emailaddres &&
      other.ordertime == ordertime &&
      other.adminid == adminid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      image.hashCode ^
      customername.hashCode ^
      productname.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      serialcode.hashCode ^
      status.hashCode ^
      size.hashCode ^
      color.hashCode ^
      oid.hashCode ^
      details.hashCode ^
      phonenumber.hashCode ^
      address.hashCode ^
      emailaddres.hashCode ^
      ordertime.hashCode ^
      adminid.hashCode;
  }
}
