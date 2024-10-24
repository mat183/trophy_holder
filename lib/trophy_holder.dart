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

    final conditionalColorFilter = holdingTrophy
        ? const ColorFilter.mode(
            Colors.transparent,
            BlendMode.multiply,
          )
        : const ColorFilter.matrix(<double>[
            0.2126, 0.7152, 0.0722, 0, 0, // Red channel
            0.2126, 0.7152, 0.0722, 0, 0, // Green channel
            0.2126, 0.7152, 0.0722, 0, 0, // Blue channel
            0, 0, 0, 1, 0, // Alpha channel (preserve transparency)
          ]);

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ColorFiltered(
              colorFilter: conditionalColorFilter,
              child: Image.asset('assets/images/trophy2.png'),
            ),
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
