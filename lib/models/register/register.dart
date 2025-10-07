// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromMap(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromMap(String str) => RegisterResponse.fromMap(json.decode(str));

String registerResponseToMap(RegisterResponse data) => json.encode(data.toMap());

class RegisterResponse {
    bool success;
    Data? data;
    String? message;

    RegisterResponse({
        required this.success,
        this.data,
        this.message,
    });

    factory RegisterResponse.fromMap(Map<String, dynamic> json) => RegisterResponse(
        success: json["success"] ?? false,
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "data": data?.toMap(),
        "message": message,
    };
}

class Data {
    String name;

    Data({
        required this.name,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
    };
}
