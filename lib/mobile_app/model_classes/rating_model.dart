import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class RatingModelClass {
  String? customername;
  String? customerid;
  String? oid;
  String? status;
  String? productname;
int? price;
  String? details;
  String? delivereddate;
  String? productcolor;
  String? serialcode;
  int? rating;
  String? review;
String? reviewtime;
List<dynamic>? ProductImage;
 String? adminid;
  RatingModelClass({
    this.customername,
    this.customerid,
    this.oid,
    this.status,
    this.productname,
    this.price,
    this.details,
    this.delivereddate,
    this.productcolor,
    this.serialcode,
    this.rating,
    this.review,
    this.reviewtime,
    this.ProductImage,
    this.adminid,
  });

  RatingModelClass copyWith({
    String? customername,
    String? customerid,
    String? oid,
    String? status,
    String? productname,
    int? price,
    String? details,
    String? delivereddate,
    String? productcolor,
    String? serialcode,
    int? rating,
    String? review,
    String? reviewtime,
    List<dynamic>? ProductImage,
    String? adminid,
  }) {
    return RatingModelClass(
      customername: customername ?? this.customername,
      customerid: customerid ?? this.customerid,
      oid: oid ?? this.oid,
      status: status ?? this.status,
      productname: productname ?? this.productname,
      price: price ?? this.price,
      details: details ?? this.details,
      delivereddate: delivereddate ?? this.delivereddate,
      productcolor: productcolor ?? this.productcolor,
      serialcode: serialcode ?? this.serialcode,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      reviewtime: reviewtime ?? this.reviewtime,
      ProductImage: ProductImage ?? this.ProductImage,
      adminid: adminid ?? this.adminid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(customername != null){
      result.addAll({'customername': customername});
    }
    if(customerid != null){
      result.addAll({'customerid': customerid});
    }
    if(oid != null){
      result.addAll({'oid': oid});
    }
    if(status != null){
      result.addAll({'status': status});
    }
    if(productname != null){
      result.addAll({'productname': productname});
    }
    if(price != null){
      result.addAll({'price': price});
    }
    if(details != null){
      result.addAll({'details': details});
    }
    if(delivereddate != null){
      result.addAll({'delivereddate': delivereddate});
    }
    if(productcolor != null){
      result.addAll({'productcolor': productcolor});
    }
    if(serialcode != null){
      result.addAll({'serialcode': serialcode});
    }
    if(rating != null){
      result.addAll({'rating': rating});
    }
    if(review != null){
      result.addAll({'review': review});
    }
    if(reviewtime != null){
      result.addAll({'reviewtime': reviewtime});
    }
    if(ProductImage != null){
      result.addAll({'ProductImage': ProductImage});
    }
    if(adminid != null){
      result.addAll({'adminid': adminid});
    }
  
    return result;
  }

  factory RatingModelClass.fromMap(Map<String, dynamic> map) {
    return RatingModelClass(
      customername: map['customername'],
      customerid: map['customerid'],
      oid: map['oid'],
      status: map['status'],
      productname: map['productname'],
      price: map['price']?.toInt(),
      details: map['details'],
      delivereddate: map['delivereddate'],
      productcolor: map['productcolor'],
      serialcode: map['serialcode'],
      rating: map['rating']?.toInt(),
      review: map['review'],
      reviewtime: map['reviewtime'],
      ProductImage: List<dynamic>.from(map['ProductImage']),
      adminid: map['adminid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModelClass.fromJson(String source) => RatingModelClass.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RatingModelClass(customername: $customername, customerid: $customerid, oid: $oid, status: $status, productname: $productname, price: $price, details: $details, delivereddate: $delivereddate, productcolor: $productcolor, serialcode: $serialcode, rating: $rating, review: $review, reviewtime: $reviewtime, ProductImage: $ProductImage, adminid: $adminid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RatingModelClass &&
      other.customername == customername &&
      other.customerid == customerid &&
      other.oid == oid &&
      other.status == status &&
      other.productname == productname &&
      other.price == price &&
      other.details == details &&
      other.delivereddate == delivereddate &&
      other.productcolor == productcolor &&
      other.serialcode == serialcode &&
      other.rating == rating &&
      other.review == review &&
      other.reviewtime == reviewtime &&
      listEquals(other.ProductImage, ProductImage) &&
      other.adminid == adminid;
  }

  @override
  int get hashCode {
    return customername.hashCode ^
      customerid.hashCode ^
      oid.hashCode ^
      status.hashCode ^
      productname.hashCode ^
      price.hashCode ^
      details.hashCode ^
      delivereddate.hashCode ^
      productcolor.hashCode ^
      serialcode.hashCode ^
      rating.hashCode ^
      review.hashCode ^
      reviewtime.hashCode ^
      ProductImage.hashCode ^
      adminid.hashCode;
  }
}
