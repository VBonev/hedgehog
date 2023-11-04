import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void changeFavorites({
    required String? id,
    required bool isFavorite,
  }) {
    final storedFavorites = prefs.getString(
      RiderSharedPreferencesKeys.favorites,
    );
    Map<String?, dynamic> newList = {};
    if (storedFavorites == null) {
      newList = {id: isFavorite};
    } else {
      newList = jsonDecode(storedFavorites);
      newList[id] = isFavorite;
    }
    prefs.setString(
      RiderSharedPreferencesKeys.favorites,
      jsonEncode(newList),
    );
  }

  Map<String?, dynamic> getFavorites() {
    final storedFavorites = prefs.getString(
      RiderSharedPreferencesKeys.favorites,
    );
    if (storedFavorites != null) {
      return jsonDecode(storedFavorites);
    }
    return {};
  }

  static SharedPreferencesManager of(BuildContext context) =>
      GetIt.instance.get<SharedPreferencesManager>();
}

class RiderSharedPreferencesKeys {
  static const String favorites = 'favorites';
}
