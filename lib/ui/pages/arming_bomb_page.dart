import 'package:airsoft_bomb/cfg/global_keys_settings.dart';
import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:airsoft_bomb/ui/pages/desfusing_bomb_page.dart';
import 'package:airsoft_bomb/ui/util/play_sound_util.dart';
import 'package:airsoft_bomb/ui/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

class ArmingBombPage extends StatefulWidget {
  const ArmingBombPage({super.key});

  @override
  State<ArmingBombPage> createState() => _ArmingBombPageState();
}

class _ArmingBombPageState extends State<ArmingBombPage> {
  final _armingTime = GlobalConfiguration().getValue(timeToArm);
  final _playSoundUtil = PlaySoundUtil.withPath("audio/move_out.mp3");

  @override
  void initState() {
    super.initState();
    _playSoundUtil.playSound();
  }

  @override
  void dispose() {
    super.dispose();
    _playSoundUtil.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sentences = context.getSentences();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(sentences.arming_bomb_page__title, style: Theme.of(context).textTheme.displaySmall),
                    Text(sentences.arming_bomb_page__counter(_armingTime), style: Theme.of(context).textTheme.bodyLarge),
                  ],
                )
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: MainButtonWidget(
                      time: _armingTime,
                      onClickFunction: _activateBomb,
                      text: sentences.arming_bomb_page__arm_btn,
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _activateBomb() => Navigator.push(context,
      MaterialPageRoute(builder: (context) => const DefusingBombPage()));
}
