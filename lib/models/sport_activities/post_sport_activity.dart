// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostSportActivity {
  final int? userId;
  final int? sportCategoryId;
  final int? cityId;
  final String? title;
  final String? description;
  final int? price;
  final int? priceDiscount;
  final int? slot;
  final String? address;
  final String? mapUrl;
  final String? activityDate;
  final String? startTime;
  final String? endTime;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  PostSportActivity({
    this.userId,
    this.sportCategoryId,
    this.cityId,
    this.title,
    this.description,
    this.price,
    this.priceDiscount,
    this.slot,
    this.address,
    this.mapUrl,
    this.activityDate,
    this.startTime,
    this.endTime,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  PostSportActivity copyWith({
    int? userId,
    int? sportCategoryId,
    int? cityId,
    String? title,
    String? description,
    int? price,
    int? priceDiscount,
    int? slot,
    String? address,
    String? mapUrl,
    String? activityDate,
    String? startTime,
    String? endTime,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    return PostSportActivity(
      userId: userId ?? this.userId,
      sportCategoryId: sportCategoryId ?? this.sportCategoryId,
      cityId: cityId ?? this.cityId,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      priceDiscount: priceDiscount ?? this.priceDiscount,
      slot: slot ?? this.slot,
      address: address ?? this.address,
      mapUrl: mapUrl ?? this.mapUrl,
      activityDate: activityDate ?? this.activityDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'sport_category_id': sportCategoryId,
      'city_id': cityId,
      'title': title,
      'description': description,
      'price': price,
      'price_discount': priceDiscount,
      'slot': slot,
      'address': address,
      'map_url': mapUrl,
      'activity_date': activityDate,
      'start_time': startTime,
      'end_time': endTime,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }

  factory PostSportActivity.fromMap(Map<String, dynamic> map) {
    return PostSportActivity(
      userId: map['user_id'] != null ? map['user_id'] as int : null,
      sportCategoryId: map['sport_category_id'] != null ? map['sport_category_id'] as int : null,
      cityId: map['city_id'] != null ? map['city_id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      priceDiscount: map['price_discount'] != null ? map['price_discount'] as int : null,
      slot: map['slot'] != null ? map['slot'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      mapUrl: map['map_url'] != null ? map['map_url'] as String : null,
      activityDate: map['activity_date'] != null ? map['activity_date'] as String : null,
      startTime: map['start_time'] != null ? map['start_time'] as String : null,
      endTime: map['end_time'] != null ? map['end_time'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostSportActivity.fromJson(String source) =>
      PostSportActivity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostSportActivity(userId: $userId, sportCategoryId: $sportCategoryId, cityId: $cityId, title: $title, description: $description, price: $price, priceDiscount: $priceDiscount, slot: $slot, address: $address, mapUrl: $mapUrl, activityDate: $activityDate, startTime: $startTime, endTime: $endTime, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(covariant PostSportActivity other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.sportCategoryId == sportCategoryId &&
        other.cityId == cityId &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.priceDiscount == priceDiscount &&
        other.slot == slot &&
        other.address == address &&
        other.mapUrl == mapUrl &&
        other.activityDate == activityDate &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.id == id;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        sportCategoryId.hashCode ^
        cityId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        priceDiscount.hashCode ^
        slot.hashCode ^
        address.hashCode ^
        mapUrl.hashCode ^
        activityDate.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        id.hashCode;
  }
}
