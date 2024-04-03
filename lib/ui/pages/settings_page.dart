import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sentences = context.getSentences();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text(sentences.settings_page__to_arm_btn)),
              ElevatedButton(onPressed: () {}, child: Text(sentences.settings_page__bomb_time_btn)),
              ElevatedButton(onPressed: () {}, child: Text(sentences.settings_page__to_defusal_btn)),
            ],
          ),
        ),
      ),
    );
  }
}
