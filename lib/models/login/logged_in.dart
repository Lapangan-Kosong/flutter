// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class LoggedIn {
  final example = {
    'token': '2328|qBRdqMQYBhStxpqzvI9LAq5hwpv52ujUwNF4ytv84e38c77a',
    'name': 'Syukran',
    'email': 'syukran@gmail.com'
  };

  final String? token;
  final String? name;
  final String? email;

  LoggedIn({
    this.token,
    this.name,
    this.email,
  });

  LoggedIn copyWith({
    String? token,
    String? name,
    String? email,
  }) {
    return LoggedIn(
      token: token ?? this.token,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'name': name,
      'email': email,
    };
  }

  factory LoggedIn.fromMap(Map<String, dynamic> map) {
    final token = map['token'];
    debugPrint('parser => $token');
    final name = map['name'];
    debugPrint('parser => $name');
    final email = map['email'];
    debugPrint('parser => $email');

    return LoggedIn(
      token: map['token'] != null ? map['token'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedIn.fromJson(String source) =>
      LoggedIn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoggedIn(token: $token, name: $name, email: $email)';
  }

  @override
  bool operator ==(covariant LoggedIn other) {
    if (identical(this, other)) return true;

    return other.token == token && other.name == name && other.email == email;
  }

  @override
  int get hashCode {
    return token.hashCode ^ name.hashCode ^ email.hashCode;
  }
}
