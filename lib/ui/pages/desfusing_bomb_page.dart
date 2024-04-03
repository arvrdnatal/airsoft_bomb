import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:flutter/material.dart';

class DefusingBombPage extends StatefulWidget {
  const DefusingBombPage({super.key});

  @override
  State<DefusingBombPage> createState() => _DefusingBombPageState();
}

class _DefusingBombPageState extends State<DefusingBombPage> {
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
                      const Text("00:00"),
                      Text(sentences.defusing_bomb_page__counter(4))
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
                        fillColor: Colors.redAccent,
                        shape: const CircleBorder(),
                        child: Text(sentences.defusing_bomb_page__defuse_btn),
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
