import 'dart:convert';

class UserModel {
  String? name;
  String? email;
  String? password;
  
  String? tockenId;
  String? uid;
  UserModel({
    this.name,
    this.email,
    this.password,
    this.tockenId,
    this.uid,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? tockenId,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      tockenId: tockenId ?? this.tockenId,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(name != null){
      result.addAll({'name': name});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(password != null){
      result.addAll({'password': password});
    }
    if(tockenId != null){
      result.addAll({'tockenId': tockenId});
    }
    if(uid != null){
      result.addAll({'uid': uid});
    }
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      tockenId: map['tockenId'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password, tockenId: $tockenId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.tockenId == tockenId &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      tockenId.hashCode ^
      uid.hashCode;
  }
}
