// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:abs/models/sport_activities/sport_activities.dart';

class SportCategoriesListData {
  final example = {
    "error": false,
    "result": [
      {
        "id": 188,
        "name": "basket ceria",
        "created_at": "2025-07-04T07:20:45.000000Z",
        "updated_at": "2025-08-21T10:22:44.000000Z"
      }
    ]
  };

  final bool? error;
  final List<SportCategory>? result;

  SportCategoriesListData({
    this.error,
    this.result,
  });

  SportCategoriesListData copyWith({
    bool? error,
    List<SportCategory>? result,
  }) {
    return SportCategoriesListData(
      error: error ?? this.error,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'result': result?.map((x) => x.toMap()).toList(),
    };
  }

  factory SportCategoriesListData.fromMap(Map<String, dynamic> map) {
    return SportCategoriesListData(
      error: map['error'] != null ? map['error'] as bool : null,
      result: map['result'] != null
          ? List<SportCategory>.from(
              (map['result'] as List<dynamic>).map<SportCategory?>(
                (x) => SportCategory.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SportCategoriesListData.fromJson(String source) =>
      SportCategoriesListData.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SportCategoriesListData(error: $error, result: $result)';
  }

  @override
  bool operator ==(covariant SportCategoriesListData other) {
    if (identical(this, other)) return true;

    return other.error == error && listEquals(other.result, result);
  }

  @override
  int get hashCode {
    return error.hashCode ^ result.hashCode;
  }
}
