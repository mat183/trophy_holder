import 'package:flutter/material.dart';
import 'package:trophy_holder/views/competitions_view.dart';

void main() {
  runApp(const TrophyHolder());
}

class TrophyHolder extends StatelessWidget {
  const TrophyHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CompetitionsView(),
    );
  }
}
