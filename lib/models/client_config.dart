// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ClientConfig {
  // static const primaryColor = Colors.green;
  // static const secondaryColor = Colors.purple;
  // static const baseUrl = 'https://abs.bosstan.id/api';

  // // images
  // static const logo = 'assets/images/logo.png';
  // static const background = 'assets/images/background.png';
  final Color primaryColor;
  final Color secondaryColor;
  final String baseUrl;

  // images
  final String? logo;
  final String? background;
  ClientConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.baseUrl,
    this.logo,
    this.background,
  });

  ClientConfig copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    String? baseUrl,
    String? logo,
    String? background,
  }) {
    return ClientConfig(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      baseUrl: baseUrl ?? this.baseUrl,
      logo: logo ?? this.logo,
      background: background ?? this.background,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, double> colorToMap(Color color) => {
          'a': color.a,
          'r': color.r,
          'g': color.g,
          'b': color.b,
        };
    return <String, dynamic>{
      'primaryColor': colorToMap(primaryColor),
      'secondaryColor': colorToMap(secondaryColor),
      'baseUrl': baseUrl,
      'logo': logo,
      'background': background,
    };
  }

  factory ClientConfig.fromMap(Map<String, dynamic> map) {
    Color colorFromMap(Map<String, dynamic> c) =>
        Color.fromARGB(c['a'], c['r'], c['g'], c['b']);
    return ClientConfig(
      primaryColor:
          colorFromMap(Map<String, dynamic>.from(map['primaryColor'])),
      secondaryColor:
          colorFromMap(Map<String, dynamic>.from(map['secondaryColor'])),
      baseUrl: map['baseUrl'] as String,
      logo: map['logo'] != null ? map['logo'] as String : null,
      background:
          map['background'] != null ? map['background'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientConfig.fromJson(String source) =>
      ClientConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientConfig(primaryColor: $primaryColor, secondaryColor: $secondaryColor, baseUrl: $baseUrl, logo: $logo, background: $background)';
  }

  @override
  bool operator ==(covariant ClientConfig other) {
    if (identical(this, other)) return true;

    return other.primaryColor == primaryColor &&
        other.secondaryColor == secondaryColor &&
        other.baseUrl == baseUrl &&
        other.logo == logo &&
        other.background == background;
  }

  @override
  int get hashCode {
    return primaryColor.hashCode ^
        secondaryColor.hashCode ^
        baseUrl.hashCode ^
        logo.hashCode ^
        background.hashCode;
  }
}
