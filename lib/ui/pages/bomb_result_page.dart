import 'package:airsoft_bomb/cfg/global_keys_settings.dart';
import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:airsoft_bomb/ui/pages/home_page.dart';
import 'package:airsoft_bomb/ui/util/play_sound_util.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

class BombResultPage extends StatefulWidget {
  const BombResultPage({super.key, required this.isSuccess});

  final bool isSuccess;

  @override
  State<BombResultPage> createState() => _BombResultPageState();
}

class _BombResultPageState extends State<BombResultPage> {
  final _defusingSoundPath = "audio/bomb_defused.mp3";
  final _explosionSoundPath = "audio/explosion.mp3";
  final _specialSoundPath = "audio/special_explosion.mp3";

  final _playSoundUtil = PlaySoundUtil();

  final _hasSpecialSound = GlobalConfiguration().getValue(specialExplosion);

  @override
  void initState() {
    super.initState();
    (widget.isSuccess)
        ? _playSoundUtil.setPath(_defusingSoundPath)
        :  _playSoundUtil.setPath(_explosionSoundPath);
    _playSoundUtil.playSound(
      whenCompleted: () {
        if (_hasSpecialSound) {
          _playSoundUtil.setPath(_specialSoundPath);
          _playSoundUtil.playSound(whenCompleted: () => _playSoundUtil.dispose());
        }
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    _playSoundUtil.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sentences = context.getSentences();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.isSuccess
                    ? sentences.bomb_result_page__success_title
                    : sentences.bomb_result_page__fail_title),
                ElevatedButton(
                    onPressed: _tryAgain,
                    child: Text(sentences.bomb_result_page__back_to_home_btn))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tryAgain() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false);
}
