// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class CustomTimer extends StatefulWidget {
  const CustomTimer({
    super.key,
    this.width,
    this.height,
    required this.isRecording,
  });

  final double? width;
  final double? height;
  final bool isRecording;

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {});
    });
  }

  void stopTimer() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void resetTimer() {
    stopTimer();
    _stopwatch.reset();
    setState(() {});
  }

  String getFormattedTime() {
    int _milliseconds = _stopwatch.elapsedMilliseconds;
    int minutes = (_milliseconds ~/ 60000) % 60;
    int seconds = (_milliseconds ~/ 1000) % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  void initState() {
    super.initState();
    widget.isRecording ? startTimer() : stopTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '${getFormattedTime()}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
