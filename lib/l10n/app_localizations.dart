
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:snag_application_1/user_preferences.dart';
import 'package:yaml/yaml.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    String yamlString = await rootBundle.loadString('lib/assets/lang/${locale.languageCode}.yaml');
    YamlMap yamlMap = loadYaml(yamlString);

    _localizedStrings = yamlMap.map((key, value) => MapEntry(key, value.toString()));

    await userPreferences.load();

    return true;
  }

  String translate(String key) {
    String? preferredTerm = userPreferences.getPreferredTerm(key);
    return _localizedStrings![preferredTerm] ?? _localizedStrings![key] ?? key;
  }

}


class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  // this contains the list of supported languages
  // !TODO: Update this list so that it is taken from a general settings file
  @override
  bool isSupported(Locale locale) {
    return ['en', 'pl', 'de'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}