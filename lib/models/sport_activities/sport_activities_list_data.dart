// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:abs/models/sport_activities/sport_activities.dart';

class SportActivitiesListData {
  final example = {
    "error": false,
    "result": {
      "current_page": 1,
      "data": [
        {
          "id": 92,
          "sport_category_id": 157,
          "city_id": 3172,
          "user_id": 246,
          "title": "MAIN BASKET BARENG WOY",
          "price": 150000,
          "price_discount": null,
          "slot": 999,
          "address": "Noldua National Stadium",
          "activity_date": "2025-11-01",
          "start_time": "10:00:00",
          "end_time": "12:00:00",
          "created_at": "2025-08-26T06:28:48.000000Z",
          "updated_at": "2025-08-31T09:39:20.000000Z",
          "organizer": {
            "id": 246,
            "name": "Admin Tamvan",
            "email": "admin_sn@gmail.com"
          },
          "city": {
            "city_id": 3172,
            "province_id": 31,
            "city_name": "Jakarta Timur",
            "city_name_full": "Kota Jakarta Timur",
            "city_type": "kota",
            "city_lat": null,
            "city_lon": null,
            "province": {
              "province_id": 31,
              "province_name": "DKI Jakarta",
              "province_name_abbr": "DKI",
              "province_name_id": "DKI Jakarta",
              "province_name_en": "Special Capital Region of Jakarta",
              "province_capital_city_id": 3173,
              "iso_code": "ID-JK",
              "iso_name": "Jakarta Raya",
              "iso_type": "special district",
              "iso_geounit": "JW",
              "timezone": 7,
              "province_lat": -6.21154,
              "province_lon": 106.845169
            }
          },
          "sport_category": {
            "id": 157,
            "name": "Basketball",
            "created_at": "2025-06-23T18:50:12.000000Z",
            "updated_at": "2025-06-23T18:50:12.000000Z"
          },
          "participants": [
            {
              "id": 208,
              "sport_activity_id": 92,
              "user_id": 247,
              "user": {
                "id": 247,
                "name": "User",
                "email": "user_sn@gmail.com"
              }
            }
          ]
        }
      ],
      "first_page_url": "http://localhost:4030/api/v1/sport-activities?page=1",
      "from": 1,
      "last_page": 1,
      "last_page_url": "http://localhost:4030/api/v1/sport-activities?page=1",
      "links": [
        {
          "url": null,
          "label": "&laquo; Previous",
          "active": false
        },
        {
          "url": "http://localhost:4030/api/v1/sport-activities?page=1",
          "label": "1",
          "active": true
        },
        {
          "url": null,
          "label": "Next &raquo;",
          "active": false
        }
      ],
      "next_page_url": null,
      "path": "http://localhost:4030/api/v1/sport-activities",
      "per_page": 5,
      "prev_page_url": null,
      "to": 1,
      "total": 1
    }
  };

  final bool? error;
  final PaginatedResult? result;

  SportActivitiesListData({
    this.error,
    this.result,
  });

  SportActivitiesListData copyWith({
    bool? error,
    PaginatedResult? result,
  }) {
    return SportActivitiesListData(
      error: error ?? this.error,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'result': result?.toMap(),
    };
  }

  factory SportActivitiesListData.fromMap(Map<String, dynamic> map) {
    return SportActivitiesListData(
      error: map['error'] != null ? map['error'] as bool : null,
      result: map['result'] != null
          ? PaginatedResult.fromMap(map['result'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SportActivitiesListData.fromJson(String source) =>
      SportActivitiesListData.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SportActivitiesListData(error: $error, result: $result)';

  @override
  bool operator ==(covariant SportActivitiesListData other) {
    if (identical(this, other)) return true;

    return other.error == error && other.result == result;
  }

  @override
  int get hashCode => error.hashCode ^ result.hashCode;
}

class PaginatedResult {
  final int? currentPage;
  final List<SportActivity>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<PaginationLink>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  PaginatedResult({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  PaginatedResult copyWith({
    int? currentPage,
    List<SportActivity>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<PaginationLink>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) {
    return PaginatedResult(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'data': data?.map((x) => x.toMap()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links?.map((x) => x.toMap()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }

  factory PaginatedResult.fromMap(Map<String, dynamic> map) {
    return PaginatedResult(
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      data: map['data'] != null
          ? List<SportActivity>.from(
              (map['data'] as List<dynamic>).map<SportActivity?>(
                (x) => SportActivity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      firstPageUrl:
          map['first_page_url'] != null ? map['first_page_url'] as String : null,
      from: map['from'] != null ? map['from'] as int : null,
      lastPage: map['last_page'] != null ? map['last_page'] as int : null,
      lastPageUrl:
          map['last_page_url'] != null ? map['last_page_url'] as String : null,
      links: map['links'] != null
          ? List<PaginationLink>.from(
              (map['links'] as List<dynamic>).map<PaginationLink?>(
                (x) => PaginationLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      nextPageUrl:
          map['next_page_url'] != null ? map['next_page_url'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      perPage: map['per_page'] != null ? map['per_page'] as int : null,
      prevPageUrl:
          map['prev_page_url'] != null ? map['prev_page_url'] as String : null,
      to: map['to'] != null ? map['to'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedResult.fromJson(String source) =>
      PaginatedResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaginatedResult(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, links: $links, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(covariant PaginatedResult other) {
    if (identical(this, other)) return true;

    return other.currentPage == currentPage &&
        listEquals(other.data, data) &&
        other.firstPageUrl == firstPageUrl &&
        other.from == from &&
        other.lastPage == lastPage &&
        other.lastPageUrl == lastPageUrl &&
        listEquals(other.links, links) &&
        other.nextPageUrl == nextPageUrl &&
        other.path == path &&
        other.perPage == perPage &&
        other.prevPageUrl == prevPageUrl &&
        other.to == to &&
        other.total == total;
  }

  @override
  int get hashCode {
    return currentPage.hashCode ^
        data.hashCode ^
        firstPageUrl.hashCode ^
        from.hashCode ^
        lastPage.hashCode ^
        lastPageUrl.hashCode ^
        links.hashCode ^
        nextPageUrl.hashCode ^
        path.hashCode ^
        perPage.hashCode ^
        prevPageUrl.hashCode ^
        to.hashCode ^
        total.hashCode;
  }
}

class PaginationLink {
  final String? url;
  final String? label;
  final bool? active;

  PaginationLink({
    this.url,
    this.label,
    this.active,
  });

  PaginationLink copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return PaginationLink(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory PaginationLink.fromMap(Map<String, dynamic> map) {
    return PaginationLink(
      url: map['url'] != null ? map['url'] as String : null,
      label: map['label'] != null ? map['label'] as String : null,
      active: map['active'] != null ? map['active'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationLink.fromJson(String source) =>
      PaginationLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PaginationLink(url: $url, label: $label, active: $active)';

  @override
  bool operator ==(covariant PaginationLink other) {
    if (identical(this, other)) return true;

    return other.url == url && other.label == label && other.active == active;
  }

  @override
  int get hashCode => url.hashCode ^ label.hashCode ^ active.hashCode;
}
