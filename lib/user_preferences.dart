import 'dart:convert';
import 'package:flutter/services.dart';

class UserPreferences {
  Map<String, String>? _preferredTerms;

  Future<void> load() async {
    String jsonString = await rootBundle.loadString('assets/user_preferences.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _preferredTerms = (jsonMap['preferredTerms'] as Map<String, dynamic>).map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String? getPreferredTerm(String key) {
    return _preferredTerms?[key];
  }
}

final userPreferences = UserPreferences();