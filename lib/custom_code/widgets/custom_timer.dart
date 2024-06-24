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
  Timer? _timer;
  int _milliseconds = 0;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        _milliseconds++;
      });
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      _milliseconds = 0;
    });
  }

  String getFormattedTime() {
    int seconds = _milliseconds ~/ 1000;
    int milliseconds = _milliseconds % 1000;
    double fractionalSeconds = milliseconds / 1000.0;
    return '${seconds.toString()}.${fractionalSeconds.toStringAsFixed(2).substring(2)}';
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
