import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String username;
  String? password;
  String? image;
  int? balance;
  User({required this.username, this.password, this.image, this.balance});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'image': image,
      'balance': balance,
    };
  }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       username: map['username'] as String,
//       password: map['password'] as String,
//       image: map['image'] != null ? map['image'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) =>
//       User.fromMap(json.decode(source) as Map<String, dynamic>);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      balance: map['balance'] != null ? map['balance'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
