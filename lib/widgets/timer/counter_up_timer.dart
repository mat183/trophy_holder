import 'dart:async';

import 'package:flutter/material.dart';

class CounterUpTimer extends StatefulWidget {
  const CounterUpTimer(
      {super.key, required this.buttonText, required this.onButtonPress});

  final String buttonText;
  final void Function() onButtonPress;

  @override
  State<CounterUpTimer> createState() {
    return _CounterUpTimerState();
  }
}

class _CounterUpTimerState extends State<CounterUpTimer> {
  Timer? _timer;
  int _seconds = 0;

  void _startTimer() {
    if (_timer != null && _timer!.isActive) {
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
    });
  }

  void _restartTimer() {
    _resetTimer();
    _startTimer();
    widget.onButtonPress();
  }

  String get _formattedTime {
    int days = _seconds ~/ (24 * 3600);
    int hours = (_seconds % (24 * 3600)) ~/ 3600;
    int minutes = (_seconds % 3600) ~/ 60;
    int seconds = _seconds % 60;

    return '${days.toString().padLeft(2, '0')} : '
        '${hours.toString().padLeft(2, '0')} : '
        '${minutes.toString().padLeft(2, '0')} : '
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Elapsed Time: $_formattedTime',
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _restartTimer,
          child: Text(widget.buttonText),
        ),
      ],
    );
  }
}
