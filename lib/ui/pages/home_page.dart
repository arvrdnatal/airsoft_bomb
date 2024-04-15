import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:airsoft_bomb/ui/pages/arming_bomb_page.dart';
import 'package:airsoft_bomb/ui/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sentences = context.getSentences();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => _onStartButtonClicked(context),
                  child: Text(sentences.home_page__start_btn)),
              ElevatedButton(
                  onPressed: () => _onSettingsButtonClicked(context),
                  child: Text(sentences.home_page__settings_btn)),
            ],
          ),
        ),
      ),
    );
  }

  void _onStartButtonClicked(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ArmingBombPage())
  );

  void _onSettingsButtonClicked(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SettingsPage())
  );
}
