import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:soundpool/soundpool.dart';

class PlaySoundUtil {
  final Soundpool _pool = Soundpool.fromOptions();
  late String? _path;

  PlaySoundUtil();

  PlaySoundUtil.withPath(String path) {
    _path = path;
  }

  void playSound() {
    _path?.let((path) async {
      int soundId = await rootBundle.load(path).then((ByteData soundData) {
        return _pool.load(soundData);
      });
      await _pool.play(soundId);
    }) ?? run(() {
      if (kDebugMode) print("O path não pode ser nulo");
      return null;
    });
  }

  void setPath(String path) => _path = path;
}