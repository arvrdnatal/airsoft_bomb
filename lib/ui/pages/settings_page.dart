import 'package:airsoft_bomb/cfg/global_keys_settings.dart';
import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:airsoft_bomb/ui/widgets/main_number_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _preferences = SharedPreferences.getInstance();

  late int _currentToArmInt = GlobalConfiguration().getValue(timeToArm);
  late int _currentBombInt = GlobalConfiguration().getValue(bombTime);
  late int _currentToDefuseInt = GlobalConfiguration().getValue(timeToDefuse);

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
                  onPressed: () => _onSettingButtonClicked(context, SettingsType.toArm),
                  child: Text(sentences.settings_page__to_arm_btn)),
              ElevatedButton(
                  onPressed: () => _onSettingButtonClicked(context, SettingsType.bomb),
                  child: Text(sentences.settings_page__bomb_time_btn)),
              ElevatedButton(
                  onPressed: () => _onSettingButtonClicked(context, SettingsType.toDefuse),
                  child: Text(sentences.settings_page__to_defusal_btn)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSettingButtonClicked(BuildContext context, SettingsType type) async {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(context.getSentences().settings_page__dialog_title),
        content: Center(child: _setNumberPicker(type)),
        actions: <Widget>[
          TextButton(
            child: Text(context.getSentences().settings_page__dialog_cancel_btn),
            onPressed: () => _onCancelDialogBtnClicked(context),
          ),
          TextButton(
            child: Text(context.getSentences().settings_page__dialog_confirm_btn),
            onPressed: () => _onConfirmDialogBtnClicked(context),
          ),
        ],
      );
    });
  }

  Widget _setNumberPicker(SettingsType type) {
    final map = switch (type) {
      SettingsType.toArm => MapEntry(timeToArm, MapEntry(_currentToArmInt, (int n) => _currentToArmInt = n)),
      SettingsType.bomb => MapEntry(bombTime, MapEntry(_currentBombInt, (int n) => _currentBombInt = n)),
      SettingsType.toDefuse => MapEntry(timeToDefuse, MapEntry(_currentToDefuseInt, (int n) => _currentToDefuseInt = n))
    };

    return MainNumberPickerWidget(
        minValue: 1,
        maxValue: 100,
        currentValue: map.value.key,
        onChange: (n) async {
          (await _preferences).setInt(map.key, n).whenComplete(
              () => GlobalConfiguration().updateValue(map.key, n));
          setState(() {
            map.value.value(n);
          });
        });
  }

  void _onCancelDialogBtnClicked(BuildContext context) => Navigator.pop(context);

  void _onConfirmDialogBtnClicked(BuildContext context) {
    Navigator.pop(context);
  }
}

enum SettingsType {
  toArm,
  bomb,
  toDefuse
}