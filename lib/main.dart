import 'package:flutter/material.dart';
import 'package:easy_count_timer/easy_count_timer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/images/trophy2.png'),
            const SizedBox(height: 20),
            CountTimer(
              controller: CountTimerController(),
            ),
            const SizedBox(height: 20),
            const Text('Trophy Holder!'),
          ],
        ),
      ),
    );
  }
}
