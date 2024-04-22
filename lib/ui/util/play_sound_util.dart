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

  void playSound({Function? whenCompleted}) {
    _path?.let((path) async {
      await player.play(AssetSource(path));
      // int soundId = await rootBundle.load(path).then((ByteData soundData) {
      //   return _pool.load(soundData);
      // });
      // await _pool.play(soundId);

      // Timer.periodic(const Duration(seconds: 1), (timer) {
      //   if (_remainingSeconds <= 0) {
      //     setState(() { timer.cancel(); });
      //     _explodeBomb();
      //   } else {
      //     setState(() {
      //       _playSoundUtil.playSound();
      //       _remainingSeconds--;
      //       final duration = Duration(seconds: _remainingSeconds);
      //       _remainingTime = DateFormat("mm:ss").format(DateTime.fromMicrosecondsSinceEpoch(duration.inMicroseconds));
      //     });
      //   }
      // });
    }) ?? run(() {
      if (kDebugMode) print("O path não pode ser nulo");
      return null;
    });
  }

  void setPath(String path) => _path = path;
}