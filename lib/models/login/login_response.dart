// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:abs/models/login/logged_in.dart';
import 'package:flutter/material.dart';

class LoginResponse {
  final example = {
    'data': {
      'id': 'gb',
      'kode_unit': 1,
      'nama_unit': 'Kantorku',
      'name': 'Indri Mayasari, S.Sos.',
      'nip': '198407192007012004',
      'role': 'Pegawai',
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDMxMzQ4OTcsImlhdCI6MTc0Mjg3NTY5NywiaWQiOiJnYiIsImtvZGVfdW5pdCI6IjEiLCJuYW1hX3VuaXQiOiJLYW50b3JrdSIsIm5hbWUiOiJJbmRyaSBNYXlhc2FyaSwgUy5Tb3MuIiwibmlwIjoiMTk4NDA3MTkyMDA3MDEyMDA0Iiwicm9sZSI6IlBlZ2F3YWkiLCJ1c2VybmFtZSI6IjE5ODQwNzE5MjAwNzAxMjAwNCJ9.1GoHQc0QjWI3TBI3xLKg9dogIKuEpXdP98zhSQ2eJeU',
      'username': '198407192007012004'
    },
    'message': 'LoggedIn Found!',
    'polygeon': {
      'coordinates': [
        [106.86913789565409, -6.1941505276948625],
        [106.87275210434592, -6.1941505276948625],
        [106.87275210434592, -6.1905334723051375],
        [106.86913789565409, -6.1905334723051375],
        [106.86913789565409, -6.1941505276948625]
      ]
    },
    'status': 200
  };

  final LoggedIn? user;
  final String? message;
  final int? status;

  LoginResponse({
    this.user,
    this.message,
    this.status,
  });

  LoginResponse copyWith({
    LoggedIn? user,
    String? message,
    int? status,
  }) {
    return LoginResponse(
      user: user ?? this.user,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': user?.toMap(),
      'message': message,
      'status': status,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map,
      {int statusCode = 200}) {
    debugPrint('/v1/login parser => user ${map['data']}');
    final user = map['data'] != null
        ? LoggedIn.fromMap(map['data'] as Map<String, dynamic>)
        : null;
    debugPrint('/v1/login parser => user $user');
    final message = map['message'] != null ? map['message'] as String : null;
    debugPrint('/v1/login parser => message done');
    debugPrint('/v1/login parser => polyJson done');
    debugPrint('/v1/login parser => poly done');
    final status = statusCode;
    debugPrint('/v1/login parser => status done');
    final all = LoginResponse(
      user: user,
      message: message,
      status: status,
    );
    debugPrint('/v1/login parser => all $all');
    return all;
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginResponse(user: $user, message: $message, status: $status)';
  }

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.message == message &&
        other.status == status;
  }

  @override
  int get hashCode {
    return user.hashCode ^ message.hashCode ^ status.hashCode;
  }
}
