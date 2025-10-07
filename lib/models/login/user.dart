// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';

class User {
  final example = {
    'id': 'Uk',
    'kode_unit': 0,
    'nama_unit': null,
    'name': null,
    'nip': null,
    'polygon': null,
    'role': 'Admininstrator',
    'token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDI3MDAxODUsImlhdCI6MTc0MjQ0MDk4NSwiaWQiOiJVayIsImtvZGVfdW5pdCI6IjAiLCJuYW1hX3VuaXQiOiIiLCJuYW1lIjoiIiwibmlwIjoiIiwicG9seWdvbiI6IiIsInJvbGUiOiJBZG1pbmluc3RyYXRvciIsInVzZXJuYW1lIjoiYWRtaW5pc3RyYXRvciJ9.hMxPwfs_hKCNkUYsaFBbX9b4V0mgeRA0hXIGRkknasg',
    'username': 'administrator'
  };

  final String? id;
  final String? kodeUnit;
  final String? unit;
  final String? name;
  final String? nip;
  final String? polygon;
  final String? role;
  final String? token;
  final String? username;

  User({
    this.id,
    this.kodeUnit,
    this.unit,
    this.name,
    this.nip,
    this.polygon,
    this.role,
    this.token,
    this.username,
  });

  User copyWith({
    String? id,
    String? kodeUnit,
    String? unit,
    String? name,
    String? nip,
    String? polygon,
    String? role,
    String? token,
    String? username,
  }) {
    return User(
      id: id ?? this.id,
      kodeUnit: kodeUnit ?? this.kodeUnit,
      unit: unit ?? this.unit,
      name: name ?? this.name,
      nip: nip ?? this.nip,
      polygon: polygon ?? this.polygon,
      role: role ?? this.role,
      token: token ?? this.token,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'kodeUnit': kodeUnit,
      'unit': unit,
      'name': name,
      'nip': nip,
      'polygon': polygon,
      'role': role,
      'token': token,
      'username': username,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    final id = map['id'];
    debugPrint('parser => $id');
    final kodeUnit = map['kodeUnit'];
    debugPrint('parser => $kodeUnit');
    final unit = map['unit'];
    debugPrint('parser => $unit');
    final name = map['name'];
    debugPrint('parser => $name');
    final nip = map['nip'];
    debugPrint('parser => $nip');
    final polygon = map['polygon'];
    debugPrint('parser => $polygon');
    final role = map['role'];
    debugPrint('parser => $role');
    final token = map['token'];
    debugPrint('parser => $token');
    final username = map['username'];
    debugPrint('parser => $username');

    return User(
      id: map['id'] != null ? map['id'] as String : null,
      kodeUnit: map['kodeUnit'] != null ? map['kodeUnit'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      nip: map['nip'] != null ? map['nip'] as String : null,
      polygon: map['polygon'] != null ? map['polygon'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, kodeUnit: $kodeUnit, unit: $unit, name: $name, nip: $nip, polygon: $polygon, role: $role, token: $token, username: $username)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.kodeUnit == kodeUnit &&
        other.unit == unit &&
        other.name == name &&
        other.nip == nip &&
        other.polygon == polygon &&
        other.role == role &&
        other.token == token &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        kodeUnit.hashCode ^
        unit.hashCode ^
        name.hashCode ^
        nip.hashCode ^
        polygon.hashCode ^
        role.hashCode ^
        token.hashCode ^
        username.hashCode;
  }

  Future<String?> get uuid async {
    try {
      return await FlutterUdid.consistentUdid;
    } catch (error) {
      return 'uuid gagal';
    }
  }
}
