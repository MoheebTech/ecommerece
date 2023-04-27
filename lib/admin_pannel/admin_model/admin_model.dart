import 'dart:convert';

class AdminModel {
   String? name;
  String? email;
  String? password;
 String? status;
  String? tockenId;
  String? uid;
  AdminModel({
    this.name,
    this.email,
    this.password,
    this.status,
    this.tockenId,
    this.uid,
  });

  AdminModel copyWith({
    String? name,
    String? email,
    String? password,
    String? status,
    String? tockenId,
    String? uid,
  }) {
    return AdminModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
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
    if(status != null){
      result.addAll({'status': status});
    }
    if(tockenId != null){
      result.addAll({'tockenId': tockenId});
    }
    if(uid != null){
      result.addAll({'uid': uid});
    }
  
    return result;
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      status: map['status'],
      tockenId: map['tockenId'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) => AdminModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminModel(name: $name, email: $email, password: $password, status: $status, tockenId: $tockenId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AdminModel &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.status == status &&
      other.tockenId == tockenId &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      status.hashCode ^
      tockenId.hashCode ^
      uid.hashCode;
  }
}
