import 'package:flutter/material.dart';
import 'package:heyy/screens/welcome.dart';

import 'package:heyy/language/localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).title,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      title: "Heyy!",
      home: Welcome(),
    );
  }
}
