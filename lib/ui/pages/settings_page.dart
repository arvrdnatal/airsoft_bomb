import 'package:airsoft_bomb/assets/cfg/global_keys_settings.dart';
import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final preferences = SharedPreferences.getInstance();

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
                  onPressed: _onSetTimeToArmButtonClicked,
                  child: Text(sentences.settings_page__to_arm_btn)),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(sentences.settings_page__bomb_time_btn)),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(sentences.settings_page__to_defusal_btn)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSetTimeToArmButtonClicked() async {
    (await preferences)
        .setInt(timeToArm, 10)
        .whenComplete(() => GlobalConfiguration().updateValue(timeToArm, 10));
  }
}
