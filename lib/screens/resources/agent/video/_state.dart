part of 'video.dart';

class _ScreenState extends ChangeNotifier {
  // Total duration fixed at 56:32
  final Duration totalDuration = const Duration(minutes: 56, seconds: 32);

  // Current position starts at 21:48
  Duration position = const Duration(minutes: 21, seconds: 48);

  double get progress {
    return (position.inSeconds / totalDuration.inSeconds).clamp(0.0, 1.0);
  }

  void seekTo(double value) {
    final seconds = (value * totalDuration.inSeconds).toInt();
    position = Duration(seconds: seconds);
    notifyListeners();
  }

  String formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}