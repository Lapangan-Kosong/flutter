// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostActivity {
  final example = {
    "nip": "string",
    "tanggal": "string",
    "location": "string",
    "device": "string",
    "ip_address": "string",
    "activity": "string"
  };

  final String? nip;
  final String? tanggal;
  final String? location;
  final String? device;
  final String? ipAdress;
  final String? activity;
  PostActivity({
    this.nip,
    this.tanggal,
    this.location,
    this.device,
    this.ipAdress,
    this.activity,
  });

  PostActivity copyWith({
    String? nip,
    String? tanggal,
    String? location,
    String? device,
    String? ipAdress,
    String? activity,
  }) {
    return PostActivity(
      nip: nip ?? this.nip,
      tanggal: tanggal ?? this.tanggal,
      location: location ?? this.location,
      device: device ?? this.device,
      ipAdress: ipAdress ?? this.ipAdress,
      activity: activity ?? this.activity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nip': nip,
      'tanggal': tanggal,
      'location': location,
      'device': device,
      'ip_address': ipAdress,
      'activity': activity,
    };
  }

  factory PostActivity.fromMap(Map<String, dynamic> map) {
    return PostActivity(
      nip: map['nip'] != null ? map['nip'] as String : null,
      tanggal: map['tanggal'] != null ? map['tanggal'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      device: map['device'] != null ? map['device'] as String : null,
      ipAdress: map['ip_address'] != null ? map['ip_address'] as String : null,
      activity: map['activity'] != null ? map['activity'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostActivity.fromJson(String source) =>
      PostActivity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostActivity(nip: $nip, tanggal: $tanggal, location: $location, device: $device, ip_address: $ipAdress, activity: $activity)';
  }

  @override
  bool operator ==(covariant PostActivity other) {
    if (identical(this, other)) return true;

    return other.nip == nip &&
        other.tanggal == tanggal &&
        other.location == location &&
        other.device == device &&
        other.ipAdress == ipAdress &&
        other.activity == activity;
  }

  @override
  int get hashCode {
    return nip.hashCode ^
        tanggal.hashCode ^
        location.hashCode ^
        device.hashCode ^
        ipAdress.hashCode ^
        activity.hashCode;
  }

  bool get isValid => activity != null && (activity?.trim().length ?? 0) > 5;
}
