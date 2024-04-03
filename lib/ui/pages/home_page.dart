import 'package:airsoft_bomb/l10n/app_translations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sentences = context.getSentences();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text(sentences.home_page__start_btn)),
              ElevatedButton(onPressed: () {}, child: Text(sentences.home_page__settings_btn)),
            ],
          ),
        ),
      ),
    );
  }
}
