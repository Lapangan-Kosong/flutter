// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RefreshedAuth {
  final example = {
    // kapan expired
    'exp': 1746067623,
    // kapan created
    'iat': 1745808423,
    'id': 'gb',
    'kode_unit': 1,
    'nama_unit': 'Kantorku',
    'name': 'Indri Mayasari, S.Sos.',
    'nip': '198407192007012004',
    'role': 'Pegawai',
    'username': '198407192007012004',
  };

  DateTime? get expiredTimestamp => exp == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(exp!.toInt() * 1000);

  DateTime? get issuedTimestamp => iat == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(iat!.toInt() * 1000);

  final double? exp;
  final double? iat;
  final String? id;
  final String? kodeUnit;
  final String? namaUnit;
  final String? name;
  final String? nip;
  final String? role;
  final String? username;
  RefreshedAuth({
    this.exp,
    this.iat,
    this.id,
    this.kodeUnit,
    this.namaUnit,
    this.name,
    this.nip,
    this.role,
    this.username,
  });

  RefreshedAuth copyWith({
    double? exp,
    double? iat,
    String? id,
    String? kodeUnit,
    String? namaUnit,
    String? name,
    String? nip,
    String? role,
    String? username,
  }) {
    return RefreshedAuth(
      exp: exp ?? this.exp,
      iat: iat ?? this.iat,
      id: id ?? this.id,
      kodeUnit: kodeUnit ?? this.kodeUnit,
      namaUnit: namaUnit ?? this.namaUnit,
      name: name ?? this.name,
      nip: nip ?? this.nip,
      role: role ?? this.role,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exp': exp,
      'iat': iat,
      'id': id,
      'kode_unit': kodeUnit,
      'nama_unit': namaUnit,
      'name': name,
      'nip': nip,
      'role': role,
      'username': username,
    };
  }

  factory RefreshedAuth.fromMap(Map<String, dynamic> map) {
    return RefreshedAuth(
      exp: map['exp'] != null ? map['exp'] as double : null,
      iat: map['iat'] != null ? map['iat'] as double : null,
      id: map['id'] != null ? map['id'] as String : null,
      kodeUnit: map['kode_unit'] != null ? map['kode_unit'] as String : null,
      namaUnit: map['nama_unit'] != null ? map['nama_unit'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      nip: map['nip'] != null ? map['nip'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshedAuth.fromJson(String source) =>
      RefreshedAuth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RefreshedAtuh(exp: $exp, iat: $iat, id: $id, kode_unit: $kodeUnit, nama_unit: $namaUnit, name: $name, nip: $nip, role: $role, username: $username)';
  }

  @override
  bool operator ==(covariant RefreshedAuth other) {
    if (identical(this, other)) return true;

    return other.exp == exp &&
        other.iat == iat &&
        other.id == id &&
        other.kodeUnit == kodeUnit &&
        other.namaUnit == namaUnit &&
        other.name == name &&
        other.nip == nip &&
        other.role == role &&
        other.username == username;
  }

  @override
  int get hashCode {
    return exp.hashCode ^
        iat.hashCode ^
        id.hashCode ^
        kodeUnit.hashCode ^
        namaUnit.hashCode ^
        name.hashCode ^
        nip.hashCode ^
        role.hashCode ^
        username.hashCode;
  }
}
