// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:intl/intl.dart';

class Activity {
  final example = {
    'id': 1,
    'nip': '198407192007012004',
    'tanggal': '2025-04-29T00:00:00Z',
    'location': null,
    'device': null,
    'ip_address': null,
    'activity': 'test akts',
    'ids': 'Uk'
  };

  final int? id;
  final String? nip;
  final String? tanggal;
  final String? location;
  final String? device;
  final String? ipAddress;
  final String? activity;
  final String? ids;

  DateTime? get dateTime =>
      tanggal == null ? null : DateTime.tryParse(tanggal ?? '');
  String? get formattedDateTime =>
      dateTime == null ? null : DateFormat.MMMMEEEEd('Id_id').format(dateTime!);

  final String? nice;
  Activity({
    this.id,
    this.nip,
    this.tanggal,
    this.location,
    this.device,
    this.ipAddress,
    this.activity,
    this.ids,
    this.nice,
  });

  Activity copyWith({
    int? id,
    String? nip,
    String? tanggal,
    String? location,
    String? device,
    String? ipAddress,
    String? activity,
    String? ids,
    String? nice,
  }) {
    return Activity(
      id: id ?? this.id,
      nip: nip ?? this.nip,
      tanggal: tanggal ?? this.tanggal,
      location: location ?? this.location,
      device: device ?? this.device,
      ipAddress: ipAddress ?? this.ipAddress,
      activity: activity ?? this.activity,
      ids: ids ?? this.ids,
      nice: nice ?? this.nice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nip': nip,
      'tanggal': tanggal,
      'location': location,
      'device': device,
      'ip_address': ipAddress,
      'activity': activity,
      'ids': ids,
      'nice': nice,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] != null ? map['id'] as int : null,
      nip: map['nip'] != null ? map['nip'] as String : null,
      tanggal: map['tanggal'] != null ? map['tanggal'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      device: map['device'] != null ? map['device'] as String : null,
      ipAddress: map['ip_address'] != null ? map['ip_address'] as String : null,
      activity: map['activity'] != null ? map['activity'] as String : null,
      ids: map['ids'] != null ? map['ids'] as String : null,
      nice: map['nice'] != null ? map['nice'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Activity(id: $id, nip: $nip, tanggal: $tanggal, location: $location, device: $device, ip_address: $ipAddress, activity: $activity, ids: $ids, nice: $nice)';
  }

  @override
  bool operator ==(covariant Activity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nip == nip &&
        other.tanggal == tanggal &&
        other.location == location &&
        other.device == device &&
        other.ipAddress == ipAddress &&
        other.activity == activity &&
        other.ids == ids &&
        other.nice == nice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nip.hashCode ^
        tanggal.hashCode ^
        location.hashCode ^
        device.hashCode ^
        ipAddress.hashCode ^
        activity.hashCode ^
        ids.hashCode ^
        nice.hashCode;
  }
}
