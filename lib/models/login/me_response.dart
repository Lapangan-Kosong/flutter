// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:abs/models/login/me.dart';

class MeResponse {
  final int? status;
  final String? message;
  final Me? data;

  MeResponse({
    this.status,
    this.message,
    this.data,
  });

  MeResponse copyWith({
    int? status,
    String? message,
    Me? data,
  }) {
    return MeResponse(
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

  factory MeResponse.fromMap(Map<String, dynamic> map) {
    return MeResponse(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? Me.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MeResponse.fromJson(String source) =>
      MeResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MeResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant MeResponse other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
