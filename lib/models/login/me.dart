// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Me {
  final example = {
    'id': 3,
    'name': 'Syukran',
    'email': 'syukran@gmail.com',
    'role': 'admin',
    'phone_number': null,
    'email_verified_at': null,
    'created_at': '2024-09-20T02:40:38.000000Z',
    'updated_at': '2025-03-05T07:56:41.000000Z'
  };

  final int? id;
  final String? name;
  final String? email;
  final String? role;
  final String? phoneNumber;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  Me({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phoneNumber,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  Me copyWith({
    int? id,
    String? name,
    String? email,
    String? role,
    String? phoneNumber,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return Me(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'phone_number': phoneNumber,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Me.fromMap(Map<String, dynamic> map) {
    return Me(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      phoneNumber: map['phone_number'] != null ? map['phone_number'] as String : null,
      emailVerifiedAt: map['email_verified_at'] != null ? map['email_verified_at'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Me.fromJson(String source) =>
      Me.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Me(id: $id, name: $name, email: $email, role: $role, phoneNumber: $phoneNumber, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Me other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.role == role &&
        other.phoneNumber == phoneNumber &&
        other.emailVerifiedAt == emailVerifiedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        role.hashCode ^
        phoneNumber.hashCode ^
        emailVerifiedAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
