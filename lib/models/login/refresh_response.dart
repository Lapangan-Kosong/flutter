// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:abs/models/login/refreshed_atuh.dart';

class RefreshAuthResponse {
  final example = {
    'status': 200,
    'message': 'Success',
    'data': {
      'exp': 1746067623,
      'iat': 1745808423,
      'id': 'gb',
      'kode_unit': 1,
      'nama_unit': 'Kantorku',
      'name': 'Indri Mayasari, S.Sos.',
      'nip': 198407192007012004,
      'role': 'Pegawai',
      'username': 198407192007012004,
    },
  };

  final int? status;
  final String? message;
  final RefreshedAuth? data;
  RefreshAuthResponse({
    this.status,
    this.message,
    this.data,
  });

  RefreshAuthResponse copyWith({
    int? status,
    String? message,
    RefreshedAuth? data,
  }) {
    return RefreshAuthResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory RefreshAuthResponse.fromMap(Map<String, dynamic> map) {
    return RefreshAuthResponse(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? RefreshedAuth.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshAuthResponse.fromJson(String source) =>
      RefreshAuthResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RefreshAuthResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant RefreshAuthResponse other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
