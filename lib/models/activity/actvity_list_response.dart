// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:abs/models/activity/activity_list_data.dart';

class ActvityListResponse {
  final example = {
    'status': 200,
    'message': 'Success',
    'data': {
      'items': [
        {
          'id': 1,
          'nip': '198407192007012004',
          'tanggal': '2025-04-29T00:00:00Z',
          'location': null,
          'device': null,
          'ip_address': null,
          'activity': 'test akts',
          'created_at': '2025-04-29T15:06:54.258532+07:00',
          'updated_at': '2025-04-29T15:06:54.258532+07:00',
          'created_by': 0,
          'updated_by': 0,
          'pegawai': {
            'id': 4,
            'unit_id': 1,
            'nip': '198407192007012004',
            'nama': 'Indri Mayasari, S.Sos.',
            'tempat_lahir': 'Palembang',
            'tgl_lahir': '1984-07-19T00:00:00Z',
            'created_id': 350,
            'created_at': '2022-12-27T11:37:00.93Z',
            'updated_at': '2023-09-13T08:44:13.093Z',
            'nik': 0,
            'email': null,
            'status': true,
            'unit': {
              'id': 0,
              'name': null,
              'parent_id': null,
              'address': null,
              'phone_number': null,
              'created_by': 0,
              'created_at': '0001-01-01T00:00:00Z',
              'updated_by': 0,
              'updated_at': '0001-01-01T00:00:00Z',
              'coordinate': null,
              'ids': null,
              'polygon': null
            },
            'ids': 'Vq'
          },
          'ids': 'Uk'
        },
      ],
      'page': 1,
      'size': 20,
      'max_page': 1,
      'total_pages': 0,
      'total': 0,
      'last': true,
      'first': true,
      'visible': 0
    },
  };

  final int? status;
  final String? message;
  final ActivityListData? data;
  ActvityListResponse({
    this.status,
    this.message,
    this.data,
  });

  ActvityListResponse copyWith({
    int? status,
    String? message,
    ActivityListData? data,
  }) {
    return ActvityListResponse(
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

  factory ActvityListResponse.fromMap(Map<String, dynamic> map) {
    return ActvityListResponse(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? ActivityListData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActvityListResponse.fromJson(String source) =>
      ActvityListResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ActvityListResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant ActvityListResponse other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
