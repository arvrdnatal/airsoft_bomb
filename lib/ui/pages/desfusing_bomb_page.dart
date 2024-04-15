import 'dart:async';

import 'package:airsoft_bomb/assets/cfg/global_keys_settings.dart';
import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:airsoft_bomb/ui/pages/bomb_result_page.dart';
import 'package:airsoft_bomb/ui/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:intl/intl.dart';

class DefusingBombPage extends StatefulWidget {
  const DefusingBombPage({super.key});

  @override
  State<DefusingBombPage> createState() => _DefusingBombPageState();
}

class _DefusingBombPageState extends State<DefusingBombPage> {
  final _defusingTime = GlobalConfiguration().getValue(timeToDefuse);
  late int _remainingSeconds = GlobalConfiguration().getValue(bombTime);
  late String _remainingTime;

  @override
  void initState() {
    super.initState();
    final duration = Duration(seconds: _remainingSeconds);
    _remainingTime = DateFormat("mm:ss").format(DateTime.fromMicrosecondsSinceEpoch(duration.inMicroseconds));
    _startCountdown();
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
                      Text(sentences.defusing_bomb_page__title),
                      Text(_remainingTime),
                      Text(sentences.defusing_bomb_page__counter(4))
                    ],
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: SizedBox.expand(
                      child: MainButtonWidget(
                          time: _defusingTime,
                          onClickFunction: _defuseBomb,
                          text: sentences.defusing_bomb_page__defuse_btn),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        setState(() { timer.cancel(); });
        _explodeBomb();
      } else {
        setState(() {
          _remainingSeconds--;
          final duration = Duration(seconds: _remainingSeconds);
          _remainingTime = DateFormat("mm:ss").format(DateTime.fromMicrosecondsSinceEpoch(duration.inMicroseconds));
        });
      }
    });
  }

  void _defuseBomb() => Navigator.push(context,
      MaterialPageRoute(builder: (context) => const BombResultPage(isSuccess: true)));

  void _explodeBomb() => Navigator.push(context,
      MaterialPageRoute(builder: (context) => const BombResultPage(isSuccess: false)));
}
