import 'package:vibration/vibration.dart';

Future<void> onPressAButton() async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(
      duration: 65,
    );
  }
}

Future<void> onErrorHappend() async {
  if (await Vibration.hasVibrator()) {
    Vibration.vibrate(
      duration: 130,
    );
  }
}
