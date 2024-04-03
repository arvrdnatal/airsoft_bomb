import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppTranslations on BuildContext {
  AppLocalizations getSentences() => AppLocalizations.of(this);
  getLocationsDelegates() => AppLocalizations.localizationsDelegates;
  getSuportedLocales() => AppLocalizations.supportedLocales;
}