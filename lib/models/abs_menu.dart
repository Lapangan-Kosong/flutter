import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppsMenuId {
  login,
  dashboard,
  splash,
  profile,
  activity,
  addActivity,
  settings,
  // profil,
  registrasi,
  sportActivity,
  addSportActivity,
}

class AppsMenu {
  AppsMenu({
    required this.id,
    required this.title,
    required this.route,
    required this.image,
    this.color,
    this.descriptor,
    this.description,
    this.isFave = false,
    this.isBeta = false,
    this.featureTag,
    this.collaborator,
  });

  AppsMenuId id;
  String title;
  String? description;
  String route;
  List<String>? descriptor;
  // expand this scope man, this is too restricting
  Widget? image;
  Color? color;
  Color? tintColor;
  bool isFave;
  bool isBeta;
  String? featureTag;
  String? collaborator;

  AppsMenu copyWith({
    String? route,
    List<String>? descriptor,
    Widget? image,
    Color? color,
    bool? isFave,
    bool? isBeta,
    bool? asTester,
    String? collaborator,
  }) {
    return AppsMenu(
      id: id,
      title: title,
      description: description,
      // idSasaran: idSasaran ?? this.idSasaran,
      // idIndikator: idIndikator ?? this.idIndikator,
      route: route ?? this.route,
      descriptor: descriptor ?? this.descriptor,
      image: image ?? this.image,
      color: color ?? this.color,
      isFave: isFave ?? this.isFave,
      isBeta: isBeta ?? this.isBeta,
      collaborator: collaborator ?? this.collaborator,
    );
  }

  Future<dynamic> go(
// Future<dynamic> goWithNotification(
    BuildContext context,
    WidgetRef ref, {
    String? stringQuery,
    int? intQuery,
    double? doubleQuery,
    bool? boolQuery,
    bool? replace = false,
    String? nip,
  }) async {
    // arguments
    final Map<String, dynamic> arguments = {
      'int_query': intQuery,
      'bool_query': boolQuery,
      'title': title,
      'nip': nip,
    };
    final debug = {...arguments};
    debug.removeWhere((k, v) => v == null);
    final now = DateTime.now();
    debugPrint(
        'route => ${now.hour}:${now.minute}:${now.second} going to $title with $debug');

    final nav = Navigator.of(context);

    try {
      return replace == true
          ? nav.pushReplacementNamed(
              route,
              arguments: arguments,
            )
          : nav.pushNamed(
              route,
              arguments: arguments,
            );
    } catch (error) {
      debugPrint('route => error $error');
    }
  }
}
