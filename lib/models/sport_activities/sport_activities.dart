// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class SportActivity {
  final example = {
    "id": 56,
    "sport_category_id": 148,
    "city_id": 1101,
    "user_id": 197,
    "title": "baseball anak anak",
    "price": 200000,
    "price_discount": null,
    "slot": 2,
    "address": "jl.kali lele no.1, Pidie",
    "activity_date": "2025-06-30",
    "start_time": "09:40:00",
    "end_time": "11:42:00",
    "created_at": "2025-05-07T13:40:04.000000Z",
    "updated_at": "2025-06-24T08:21:33.000000Z",
    "organizer": {
      "id": 197,
      "name": "Admin",
      "email": "admin888@gmail.com"
    },
    "city": {
      "city_id": 1101,
      "province_id": 11,
      "city_name": "Simeulue",
      "city_name_full": "Kabupaten Simeulue",
      "city_type": "kabupaten",
      "city_lat": null,
      "city_lon": null,
      "province": {
        "province_id": 11,
        "province_name": "Aceh",
        "province_name_abbr": "NAD",
        "province_name_id": "Nanggroe Aceh Darussalam",
        "province_name_en": "Nanggroe Aceh Darussalam",
        "province_capital_city_id": 1171,
        "iso_code": "ID-AC",
        "iso_name": "Aceh",
        "iso_type": "autonomous province",
        "iso_geounit": "SM",
        "timezone": 7,
        "province_lat": 4.695135,
        "province_lon": 96.749397
      }
    },
    "sport_category": {
      "id": 148,
      "name": "Hockey",
      "created_at": "2025-06-23T18:49:38.000000Z",
      "updated_at": "2025-06-23T18:49:38.000000Z"
    },
    "participants": [
      {
        "id": 156,
        "sport_activity_id": 56,
        "user_id": 166,
        "user": {
          "id": 166,
          "name": "Noel",
          "email": "noel@gmail.com"
        }
      }
    ]
  };

  final int? id;
  final int? sportCategoryId;
  final int? cityId;
  final int? userId;
  final String? title;
  final int? price;
  final int? priceDiscount;
  final int? slot;
  final String? address;
  final String? activityDate;
  final String? startTime;
  final String? endTime;
  final String? createdAt;
  final String? updatedAt;
  final Organizer? organizer;
  final City? city;
  final SportCategory? sportCategory;
  final List<Participant>? participants;

  SportActivity({
    this.id,
    this.sportCategoryId,
    this.cityId,
    this.userId,
    this.title,
    this.price,
    this.priceDiscount,
    this.slot,
    this.address,
    this.activityDate,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
    this.organizer,
    this.city,
    this.sportCategory,
    this.participants,
  });

  SportActivity copyWith({
    int? id,
    int? sportCategoryId,
    int? cityId,
    int? userId,
    String? title,
    int? price,
    int? priceDiscount,
    int? slot,
    String? address,
    String? activityDate,
    String? startTime,
    String? endTime,
    String? createdAt,
    String? updatedAt,
    Organizer? organizer,
    City? city,
    SportCategory? sportCategory,
    List<Participant>? participants,
  }) {
    return SportActivity(
      id: id ?? this.id,
      sportCategoryId: sportCategoryId ?? this.sportCategoryId,
      cityId: cityId ?? this.cityId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      price: price ?? this.price,
      priceDiscount: priceDiscount ?? this.priceDiscount,
      slot: slot ?? this.slot,
      address: address ?? this.address,
      activityDate: activityDate ?? this.activityDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      organizer: organizer ?? this.organizer,
      city: city ?? this.city,
      sportCategory: sportCategory ?? this.sportCategory,
      participants: participants ?? this.participants,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sport_category_id': sportCategoryId,
      'city_id': cityId,
      'user_id': userId,
      'title': title,
      'price': price,
      'price_discount': priceDiscount,
      'slot': slot,
      'address': address,
      'activity_date': activityDate,
      'start_time': startTime,
      'end_time': endTime,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'organizer': organizer?.toMap(),
      'city': city?.toMap(),
      'sport_category': sportCategory?.toMap(),
      'participants': participants?.map((x) => x.toMap()).toList(),
    };
  }

  factory SportActivity.fromMap(Map<String, dynamic> map) {
    final id = map['id'];
    debugPrint('parser => $id');
    final sportCategoryId = map['sport_category_id'];
    debugPrint('parser => $sportCategoryId');
    final cityId = map['city_id'];
    debugPrint('parser => $cityId');
    final userId = map['user_id'];
    debugPrint('parser => $userId');
    final title = map['title'];
    debugPrint('parser => $title');
    final price = map['price'];
    debugPrint('parser => $price');
    final priceDiscount = map['price_discount'];
    debugPrint('parser => $priceDiscount');
    final slot = map['slot'];
    debugPrint('parser => $slot');
    final address = map['address'];
    debugPrint('parser => $address');
    final activityDate = map['activity_date'];
    debugPrint('parser => $activityDate');
    final startTime = map['start_time'];
    debugPrint('parser => $startTime');
    final endTime = map['end_time'];
    debugPrint('parser => $endTime');
    final createdAt = map['created_at'];
    debugPrint('parser => $createdAt');
    final updatedAt = map['updated_at'];
    debugPrint('parser => $updatedAt');

    return SportActivity(
      id: map['id'] != null ? map['id'] as int : null,
      sportCategoryId: map['sport_category_id'] != null ? map['sport_category_id'] as int : null,
      cityId: map['city_id'] != null ? map['city_id'] as int : null,
      userId: map['user_id'] != null ? map['user_id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      priceDiscount: map['price_discount'] != null ? map['price_discount'] as int : null,
      slot: map['slot'] != null ? map['slot'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      activityDate: map['activity_date'] != null ? map['activity_date'] as String : null,
      startTime: map['start_time'] != null ? map['start_time'] as String : null,
      endTime: map['end_time'] != null ? map['end_time'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      organizer: map['organizer'] != null ? Organizer.fromMap(map['organizer'] as Map<String, dynamic>) : null,
      city: map['city'] != null ? City.fromMap(map['city'] as Map<String, dynamic>) : null,
      sportCategory: map['sport_category'] != null ? SportCategory.fromMap(map['sport_category'] as Map<String, dynamic>) : null,
      participants: map['participants'] != null ? List<Participant>.from((map['participants'] as List<dynamic>).map<Participant>((x) => Participant.fromMap(x as Map<String, dynamic>))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SportActivity.fromJson(String source) =>
      SportActivity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SportActivity(id: $id, sportCategoryId: $sportCategoryId, cityId: $cityId, userId: $userId, title: $title, price: $price, priceDiscount: $priceDiscount, slot: $slot, address: $address, activityDate: $activityDate, startTime: $startTime, endTime: $endTime, createdAt: $createdAt, updatedAt: $updatedAt, organizer: $organizer, city: $city, sportCategory: $sportCategory, participants: $participants)';
  }

  @override
  bool operator ==(covariant SportActivity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sportCategoryId == sportCategoryId &&
        other.cityId == cityId &&
        other.userId == userId &&
        other.title == title &&
        other.price == price &&
        other.priceDiscount == priceDiscount &&
        other.slot == slot &&
        other.address == address &&
        other.activityDate == activityDate &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.organizer == organizer &&
        other.city == city &&
        other.sportCategory == sportCategory &&
        other.participants == participants;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sportCategoryId.hashCode ^
        cityId.hashCode ^
        userId.hashCode ^
        title.hashCode ^
        price.hashCode ^
        priceDiscount.hashCode ^
        slot.hashCode ^
        address.hashCode ^
        activityDate.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        organizer.hashCode ^
        city.hashCode ^
        sportCategory.hashCode ^
        participants.hashCode;
  }
}

class Organizer {
  final int? id;
  final String? name;
  final String? email;

  Organizer({
    this.id,
    this.name,
    this.email,
  });

  Organizer copyWith({
    int? id,
    String? name,
    String? email,
  }) {
    return Organizer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory Organizer.fromMap(Map<String, dynamic> map) {
    return Organizer(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Organizer.fromJson(String source) =>
      Organizer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Organizer(id: $id, name: $name, email: $email)';

  @override
  bool operator ==(covariant Organizer other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}

class City {
  final int? cityId;
  final int? provinceId;
  final String? cityName;
  final String? cityNameFull;
  final String? cityType;
  final double? cityLat;
  final double? cityLon;
  final Province? province;

  City({
    this.cityId,
    this.provinceId,
    this.cityName,
    this.cityNameFull,
    this.cityType,
    this.cityLat,
    this.cityLon,
    this.province,
  });

  City copyWith({
    int? cityId,
    int? provinceId,
    String? cityName,
    String? cityNameFull,
    String? cityType,
    double? cityLat,
    double? cityLon,
    Province? province,
  }) {
    return City(
      cityId: cityId ?? this.cityId,
      provinceId: provinceId ?? this.provinceId,
      cityName: cityName ?? this.cityName,
      cityNameFull: cityNameFull ?? this.cityNameFull,
      cityType: cityType ?? this.cityType,
      cityLat: cityLat ?? this.cityLat,
      cityLon: cityLon ?? this.cityLon,
      province: province ?? this.province,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city_id': cityId,
      'province_id': provinceId,
      'city_name': cityName,
      'city_name_full': cityNameFull,
      'city_type': cityType,
      'city_lat': cityLat,
      'city_lon': cityLon,
      'province': province?.toMap(),
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityId: map['city_id'] != null ? map['city_id'] as int : null,
      provinceId: map['province_id'] != null ? map['province_id'] as int : null,
      cityName: map['city_name'] != null ? map['city_name'] as String : null,
      cityNameFull: map['city_name_full'] != null ? map['city_name_full'] as String : null,
      cityType: map['city_type'] != null ? map['city_type'] as String : null,
      cityLat: map['city_lat'] != null ? (map['city_lat'] as num).toDouble() : null,
      cityLon: map['city_lon'] != null ? (map['city_lon'] as num).toDouble() : null,
      province: map['province'] != null ? Province.fromMap(map['province'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'City(cityId: $cityId, provinceId: $provinceId, cityName: $cityName, cityNameFull: $cityNameFull, cityType: $cityType, cityLat: $cityLat, cityLon: $cityLon, province: $province)';
  }

  @override
  bool operator ==(covariant City other) {
    if (identical(this, other)) return true;

    return other.cityId == cityId &&
        other.provinceId == provinceId &&
        other.cityName == cityName &&
        other.cityNameFull == cityNameFull &&
        other.cityType == cityType &&
        other.cityLat == cityLat &&
        other.cityLon == cityLon &&
        other.province == province;
  }

  @override
  int get hashCode {
    return cityId.hashCode ^
        provinceId.hashCode ^
        cityName.hashCode ^
        cityNameFull.hashCode ^
        cityType.hashCode ^
        cityLat.hashCode ^
        cityLon.hashCode ^
        province.hashCode;
  }
}

class Province {
  final int? provinceId;
  final String? provinceName;
  final String? provinceNameAbbr;
  final String? provinceNameId;
  final String? provinceNameEn;
  final int? provinceCapitalCityId;
  final String? isoCode;
  final String? isoName;
  final String? isoType;
  final String? isoGeounit;
  final int? timezone;
  final double? provinceLat;
  final double? provinceLon;

  Province({
    this.provinceId,
    this.provinceName,
    this.provinceNameAbbr,
    this.provinceNameId,
    this.provinceNameEn,
    this.provinceCapitalCityId,
    this.isoCode,
    this.isoName,
    this.isoType,
    this.isoGeounit,
    this.timezone,
    this.provinceLat,
    this.provinceLon,
  });

  Province copyWith({
    int? provinceId,
    String? provinceName,
    String? provinceNameAbbr,
    String? provinceNameId,
    String? provinceNameEn,
    int? provinceCapitalCityId,
    String? isoCode,
    String? isoName,
    String? isoType,
    String? isoGeounit,
    int? timezone,
    double? provinceLat,
    double? provinceLon,
  }) {
    return Province(
      provinceId: provinceId ?? this.provinceId,
      provinceName: provinceName ?? this.provinceName,
      provinceNameAbbr: provinceNameAbbr ?? this.provinceNameAbbr,
      provinceNameId: provinceNameId ?? this.provinceNameId,
      provinceNameEn: provinceNameEn ?? this.provinceNameEn,
      provinceCapitalCityId: provinceCapitalCityId ?? this.provinceCapitalCityId,
      isoCode: isoCode ?? this.isoCode,
      isoName: isoName ?? this.isoName,
      isoType: isoType ?? this.isoType,
      isoGeounit: isoGeounit ?? this.isoGeounit,
      timezone: timezone ?? this.timezone,
      provinceLat: provinceLat ?? this.provinceLat,
      provinceLon: provinceLon ?? this.provinceLon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'province_id': provinceId,
      'province_name': provinceName,
      'province_name_abbr': provinceNameAbbr,
      'province_name_id': provinceNameId,
      'province_name_en': provinceNameEn,
      'province_capital_city_id': provinceCapitalCityId,
      'iso_code': isoCode,
      'iso_name': isoName,
      'iso_type': isoType,
      'iso_geounit': isoGeounit,
      'timezone': timezone,
      'province_lat': provinceLat,
      'province_lon': provinceLon,
    };
  }

  factory Province.fromMap(Map<String, dynamic> map) {
    return Province(
      provinceId: map['province_id'] != null ? map['province_id'] as int : null,
      provinceName: map['province_name'] != null ? map['province_name'] as String : null,
      provinceNameAbbr: map['province_name_abbr'] != null ? map['province_name_abbr'] as String : null,
      provinceNameId: map['province_name_id'] != null ? map['province_name_id'] as String : null,
      provinceNameEn: map['province_name_en'] != null ? map['province_name_en'] as String : null,
      provinceCapitalCityId: map['province_capital_city_id'] != null ? map['province_capital_city_id'] as int : null,
      isoCode: map['iso_code'] != null ? map['iso_code'] as String : null,
      isoName: map['iso_name'] != null ? map['iso_name'] as String : null,
      isoType: map['iso_type'] != null ? map['iso_type'] as String : null,
      isoGeounit: map['iso_geounit'] != null ? map['iso_geounit'] as String : null,
      timezone: map['timezone'] != null ? map['timezone'] as int : null,
      provinceLat: map['province_lat'] != null ? (map['province_lat'] as num).toDouble() : null,
      provinceLon: map['province_lon'] != null ? (map['province_lon'] as num).toDouble() : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Province.fromJson(String source) =>
      Province.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Province(provinceId: $provinceId, provinceName: $provinceName, provinceNameAbbr: $provinceNameAbbr, provinceNameId: $provinceNameId, provinceNameEn: $provinceNameEn, provinceCapitalCityId: $provinceCapitalCityId, isoCode: $isoCode, isoName: $isoName, isoType: $isoType, isoGeounit: $isoGeounit, timezone: $timezone, provinceLat: $provinceLat, provinceLon: $provinceLon)';
  }

  @override
  bool operator ==(covariant Province other) {
    if (identical(this, other)) return true;

    return other.provinceId == provinceId &&
        other.provinceName == provinceName &&
        other.provinceNameAbbr == provinceNameAbbr &&
        other.provinceNameId == provinceNameId &&
        other.provinceNameEn == provinceNameEn &&
        other.provinceCapitalCityId == provinceCapitalCityId &&
        other.isoCode == isoCode &&
        other.isoName == isoName &&
        other.isoType == isoType &&
        other.isoGeounit == isoGeounit &&
        other.timezone == timezone &&
        other.provinceLat == provinceLat &&
        other.provinceLon == provinceLon;
  }

  @override
  int get hashCode {
    return provinceId.hashCode ^
        provinceName.hashCode ^
        provinceNameAbbr.hashCode ^
        provinceNameId.hashCode ^
        provinceNameEn.hashCode ^
        provinceCapitalCityId.hashCode ^
        isoCode.hashCode ^
        isoName.hashCode ^
        isoType.hashCode ^
        isoGeounit.hashCode ^
        timezone.hashCode ^
        provinceLat.hashCode ^
        provinceLon.hashCode;
  }
}

class SportCategory {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  SportCategory({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  SportCategory copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) {
    return SportCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory SportCategory.fromMap(Map<String, dynamic> map) {
    return SportCategory(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SportCategory.fromJson(String source) =>
      SportCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SportCategory(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant SportCategory other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
  }
}

class Participant {
  final int? id;
  final int? sportActivityId;
  final int? userId;
  final User? user;

  Participant({
    this.id,
    this.sportActivityId,
    this.userId,
    this.user,
  });

  Participant copyWith({
    int? id,
    int? sportActivityId,
    int? userId,
    User? user,
  }) {
    return Participant(
      id: id ?? this.id,
      sportActivityId: sportActivityId ?? this.sportActivityId,
      userId: userId ?? this.userId,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sport_activity_id': sportActivityId,
      'user_id': userId,
      'user': user?.toMap(),
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
      id: map['id'] != null ? map['id'] as int : null,
      sportActivityId: map['sport_activity_id'] != null ? map['sport_activity_id'] as int : null,
      userId: map['user_id'] != null ? map['user_id'] as int : null,
      user: map['user'] != null ? User.fromMap(map['user'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Participant.fromJson(String source) =>
      Participant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Participant(id: $id, sportActivityId: $sportActivityId, userId: $userId, user: $user)';
  }

  @override
  bool operator ==(covariant Participant other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sportActivityId == sportActivityId &&
        other.userId == userId &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^ sportActivityId.hashCode ^ userId.hashCode ^ user.hashCode;
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;

  User({
    this.id,
    this.name,
    this.email,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
