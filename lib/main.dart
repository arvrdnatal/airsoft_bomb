import 'package:airsoft_bomb/assets/cfg/app_settings.dart';
import 'package:airsoft_bomb/assets/cfg/global_keys_settings.dart';
import 'package:airsoft_bomb/ui/pages/main_app.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((preferences) {
    globalSettings.update(timeToArm, (value) => preferences.getInt(timeToArm) ?? value);
    globalSettings.update(bombTime, (value) => preferences.getInt(bombTime) ?? value);
    globalSettings.update(timeToDefuse, (value) => preferences.getInt(timeToDefuse) ?? value);
    GlobalConfiguration().loadFromMap(globalSettings);
  }).onError((error, stackTrace) {
    GlobalConfiguration().loadFromMap(globalSettings);
  }).whenComplete(() => runApp(const MainApp()));
}
