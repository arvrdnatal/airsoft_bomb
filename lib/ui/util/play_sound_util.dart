import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:kotlin_flavor/scope_functions.dart';

class PlaySoundUtil {
  late AudioPlayer player = AudioPlayer();
  late String? _path;

  PlaySoundUtil();

  PlaySoundUtil.withPath(String path) {
    _path = path;
  }

  void playSound({Function? whenCompleted, double rate = 1.0}) {
    _path?.let((path) async {
      await player.setPlaybackRate(rate);
      await player.play(AssetSource(path));
      whenCompleted?.let((self) => player.onPlayerComplete.listen((event) => self()));
    }) ?? run(() {
      if (kDebugMode) print("O path não pode ser nulo");
      return null;
    });
  }

  void setPath(String path) => _path = path;
}