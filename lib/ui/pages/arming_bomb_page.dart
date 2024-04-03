import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:flutter/material.dart';

class ArmingBombPage extends StatefulWidget {
  const ArmingBombPage({super.key});

  @override
  State<ArmingBombPage> createState() => _ArmingBombPageState();
}

class _ArmingBombPageState extends State<ArmingBombPage> {
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
                      Text(sentences.arming_bomb_page__title),
                      Text(sentences.arming_bomb_page__counter(5))
                    ],
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: SizedBox.expand(
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 5.0,
                        child: Text(sentences.arming_bomb_page__arm_btn),
                        fillColor: Colors.redAccent,
                        shape: CircleBorder(),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
