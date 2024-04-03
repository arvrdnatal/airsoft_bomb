import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:flutter/material.dart';

class BombResultPage extends StatefulWidget {
  const BombResultPage({super.key, required this.isSuccess});

  final bool isSuccess;

  @override
  State<BombResultPage> createState() => _BombResultPageState();
}

class _BombResultPageState extends State<BombResultPage> {
  @override
  Widget build(BuildContext context) {
    var sentences = context.getSentences();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.isSuccess ? sentences.bomb_result_page__success_title : sentences.bomb_result_page__fail_title),
              ElevatedButton(onPressed: () {}, child: Text(sentences.bomb_result_page__back_to_home_btn))
            ],
          ),
        ),
      ),
    );
  }
}
