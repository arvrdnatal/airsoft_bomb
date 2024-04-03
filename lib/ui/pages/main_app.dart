import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:airsoft_bomb/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.getLocationsDelegates(),
      supportedLocales: context.getSuportedLocales(),
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}