import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class PlaySoundUtil {
  final Soundpool _pool = Soundpool.fromOptions();
  late String _path = "";

  PlaySoundUtil(String path) {
    _path = path;
  }

  Future<void> playSound() async {
    int soundId = await rootBundle.load(_path).then((ByteData soundData) {
      return _pool.load(soundData);
    });
    await _pool.play(soundId);
  }
}