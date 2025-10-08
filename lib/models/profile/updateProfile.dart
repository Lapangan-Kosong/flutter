// To parse this JSON data, do
//
//     final updateProfileResponse = updateProfileResponseFromMap(jsonString);

import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromMap(String str) => UpdateProfileResponse.fromMap(json.decode(str));

String updateProfileResponseToMap(UpdateProfileResponse data) => json.encode(data.toMap());

class UpdateProfileResponse {
    bool? error;
    Result? result;
    String? message;

    UpdateProfileResponse({
        this.error,
        this.result,
        this.message,
    });

    factory UpdateProfileResponse.fromMap(Map<String, dynamic> json) => UpdateProfileResponse(
        error: json["error"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "error": error,
        "result": result?.toMap(),
        "message": message,
    };
}

class Result {
    int? id;
    String? name;
    String? email;
    String? role;
    dynamic phoneNumber;
    DateTime? emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    Result({
        this.id,
        this.name,
        this.email,
        this.role,
        this.phoneNumber,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "phone_number": phoneNumber,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
