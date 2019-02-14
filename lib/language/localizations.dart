import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'dart:async';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'skip' : 'SKIP',
    },
    'es': {
      'title': 'Hola Mundo',
      'skip' : 'OMITIR',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get skip {
    return _localizedValues[locale.languageCode]['skip'];
  }
}


class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}