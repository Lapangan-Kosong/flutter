// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SplashResponse {
  final bool? status;
  final String? message;
  SplashResponse({
    this.status,
    this.message,
  });

  SplashResponse copyWith({
    bool? status,
    String? message,
  }) {
    return SplashResponse(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  factory SplashResponse.fromMap(Map<String, dynamic> map) {
    return SplashResponse(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SplashResponse.fromJson(String source) =>
      SplashResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SplashResponse(status: $status, message: $message)';

  @override
  bool operator ==(covariant SplashResponse other) {
    if (identical(this, other)) return true;

    return other.status == status && other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
