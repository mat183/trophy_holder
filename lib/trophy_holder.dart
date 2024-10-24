import 'package:flutter/material.dart';
import 'package:trophy_holder/counter_up_timer.dart';

class TrophyHolder extends StatefulWidget {
  const TrophyHolder({super.key});

  @override
  State<TrophyHolder> createState() {
    return _TrophyHolderState();
  }
}

class _TrophyHolderState extends State<TrophyHolder> {
  bool holdingTrophy = true;

  void onPressed() {
    setState(() {
      holdingTrophy = !holdingTrophy;
    });
  }

  void toggleHoldingTrophy() {
    setState(() {
      holdingTrophy = !holdingTrophy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String timerButtonText =
        holdingTrophy ? 'Return the trophy' : 'Regain the trophy';
    final String motivationalText = holdingTrophy
        ? 'You own the trophy! You are the best!'
        : 'Don\'t give up! Next time you\'ll win!';

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Image.asset('assets/images/trophy2.png'),
            const SizedBox(height: 20),
            Text(motivationalText),
            const SizedBox(height: 250),
            CounterUpTimer(
              buttonText: timerButtonText,
              onButtonPress: toggleHoldingTrophy,
            ),
          ],
        ),
      ),
    );
  }
}
