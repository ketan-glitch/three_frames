// To parse this JSON data, do
//
//     final credentialsModel = credentialsModelFromJson(jsonString);

import 'dart:convert';

List<CredentialsModel> credentialsModelFromJson(String str) => List<CredentialsModel>.from(json.decode(str).map((x) => CredentialsModel.fromJson(x)));

String credentialsModelToJson(List<CredentialsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CredentialsModel {
  String? email;
  String? password;

  CredentialsModel({
    this.email,
    this.password,
  });

  factory CredentialsModel.fromJson(Map<String, dynamic> json) => CredentialsModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CredentialsModel && runtimeType == other.runtimeType && email == other.email && password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
