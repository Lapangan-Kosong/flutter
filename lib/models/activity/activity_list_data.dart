// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:abs/models/activity/activity.dart';

class ActivityListData {
  final example = {
    'items': [],
    'page': 1,
    'size': 20,
    'max_page': 1,
    'total_pages': 0,
    'total': 0,
    'last': true,
    'first': true,
    'visible': 0
  };

  final List<Activity>? items;
  final int? page;
  final int? size;
  final int? maxPage;
  final int? totalPages;
  final int? total;
  final bool? last;
  final bool? first;
  final int? visible;
  ActivityListData({
    this.items,
    this.page,
    this.size,
    this.maxPage,
    this.totalPages,
    this.total,
    this.last,
    this.first,
    this.visible,
  });

  ActivityListData copyWith({
    List<Activity>? items,
    int? page,
    int? size,
    int? maxPage,
    int? totalPages,
    int? total,
    bool? last,
    bool? first,
    int? visible,
  }) {
    return ActivityListData(
      items: items ?? this.items,
      page: page ?? this.page,
      size: size ?? this.size,
      maxPage: maxPage ?? this.maxPage,
      totalPages: totalPages ?? this.totalPages,
      total: total ?? this.total,
      last: last ?? this.last,
      first: first ?? this.first,
      visible: visible ?? this.visible,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items?.map((x) => x.toMap()).toList(),
      'page': page,
      'size': size,
      'max_page': maxPage,
      'total_pages': totalPages,
      'total': total,
      'last': last,
      'first': first,
      'visible': visible,
    };
  }

  factory ActivityListData.fromMap(Map<String, dynamic> map) {
    return ActivityListData(
      items: map['items'] != null
          ? List<Activity>.from(
              (map['items'] as List<dynamic>).map<Activity?>(
                (x) => Activity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      page: map['page'] != null ? map['page'] as int : null,
      size: map['size'] != null ? map['size'] as int : null,
      maxPage: map['max_page'] != null ? map['max_page'] as int : null,
      totalPages: map['total_pages'] != null ? map['total_pages'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      last: map['last'] != null ? map['last'] as bool : null,
      first: map['first'] != null ? map['first'] as bool : null,
      visible: map['visible'] != null ? map['visible'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityListData.fromJson(String source) =>
      ActivityListData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActivityListData(items: $items, page: $page, size: $size, max_page: $maxPage, total_pages: $totalPages, total: $total, last: $last, first: $first, visible: $visible)';
  }

  @override
  bool operator ==(covariant ActivityListData other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items) &&
        other.page == page &&
        other.size == size &&
        other.maxPage == maxPage &&
        other.totalPages == totalPages &&
        other.total == total &&
        other.last == last &&
        other.first == first &&
        other.visible == visible;
  }

  @override
  int get hashCode {
    return items.hashCode ^
        page.hashCode ^
        size.hashCode ^
        maxPage.hashCode ^
        totalPages.hashCode ^
        total.hashCode ^
        last.hashCode ^
        first.hashCode ^
        visible.hashCode;
  }
}
