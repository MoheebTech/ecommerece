import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  String? category;
  String? id;
  String? productname;
  String? details;
  int? price;
  String? discountprice;
  String? selerialCode;
 List<dynamic>? imageUrls;
 bool? isOnSale;
 bool? isPopular;
 bool? isFavourit;
  String? brand;
  int? count;
  int? totalprice;
  ProductModel({
    this.category,
    this.id,
    this.productname,
    this.details,
    this.price,
    this.discountprice,
    this.selerialCode,
    this.imageUrls,
    this.isOnSale,
    this.isPopular,
    this.isFavourit,
    this.brand,
    this.count,
    this.totalprice,
  });

  ProductModel copyWith({
    String? category,
    String? id,
    String? productname,
    String? details,
    int? price,
    String? discountprice,
    String? selerialCode,
    List<dynamic>? imageUrls,
    bool? isOnSale,
    bool? isPopular,
    bool? isFavourit,
    String? brand,
    int? count,
    int? totalprice,
  }) {
    return ProductModel(
      category: category ?? this.category,
      id: id ?? this.id,
      productname: productname ?? this.productname,
      details: details ?? this.details,
      price: price ?? this.price,
      discountprice: discountprice ?? this.discountprice,
      selerialCode: selerialCode ?? this.selerialCode,
      imageUrls: imageUrls ?? this.imageUrls,
      isOnSale: isOnSale ?? this.isOnSale,
      isPopular: isPopular ?? this.isPopular,
      isFavourit: isFavourit ?? this.isFavourit,
      brand: brand ?? this.brand,
      count: count ?? this.count,
      totalprice: totalprice ?? this.totalprice,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(category != null){
      result.addAll({'category': category});
    }
    if(id != null){
      result.addAll({'id': id});
    }
    if(productname != null){
      result.addAll({'productname': productname});
    }
    if(details != null){
      result.addAll({'details': details});
    }
    if(price != null){
      result.addAll({'price': price});
    }
    if(discountprice != null){
      result.addAll({'discountprice': discountprice});
    }
    if(selerialCode != null){
      result.addAll({'selerialCode': selerialCode});
    }
    if(imageUrls != null){
      result.addAll({'imageUrls': imageUrls});
    }
    if(isOnSale != null){
      result.addAll({'isOnSale': isOnSale});
    }
    if(isPopular != null){
      result.addAll({'isPopular': isPopular});
    }
    if(isFavourit != null){
      result.addAll({'isFavourit': isFavourit});
    }
    if(brand != null){
      result.addAll({'brand': brand});
    }
    if(count != null){
      result.addAll({'count': count});
    }
    if(totalprice != null){
      result.addAll({'totalprice': totalprice});
    }
  
    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      category: map['category'],
      id: map['id'],
      productname: map['productname'],
      details: map['details'],
      price: map['price']?.toInt(),
      discountprice: map['discountprice'],
      selerialCode: map['selerialCode'],
      imageUrls: List<dynamic>.from(map['imageUrls']),
      isOnSale: map['isOnSale'],
      isPopular: map['isPopular'],
      isFavourit: map['isFavourit'],
      brand: map['brand'],
      count: map['count']?.toInt(),
      totalprice: map['totalprice']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(category: $category, id: $id, productname: $productname, details: $details, price: $price, discountprice: $discountprice, selerialCode: $selerialCode, imageUrls: $imageUrls, isOnSale: $isOnSale, isPopular: $isPopular, isFavourit: $isFavourit, brand: $brand, count: $count, totalprice: $totalprice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.category == category &&
      other.id == id &&
      other.productname == productname &&
      other.details == details &&
      other.price == price &&
      other.discountprice == discountprice &&
      other.selerialCode == selerialCode &&
      listEquals(other.imageUrls, imageUrls) &&
      other.isOnSale == isOnSale &&
      other.isPopular == isPopular &&
      other.isFavourit == isFavourit &&
      other.brand == brand &&
      other.count == count &&
      other.totalprice == totalprice;
  }

  @override
  int get hashCode {
    return category.hashCode ^
      id.hashCode ^
      productname.hashCode ^
      details.hashCode ^
      price.hashCode ^
      discountprice.hashCode ^
      selerialCode.hashCode ^
      imageUrls.hashCode ^
      isOnSale.hashCode ^
      isPopular.hashCode ^
      isFavourit.hashCode ^
      brand.hashCode ^
      count.hashCode ^
      totalprice.hashCode;
  }
}
