import 'package:flutter/material.dart';
import 'package:trophy_holder/models/competition.dart';

class CompetitionItem extends StatelessWidget {
  const CompetitionItem(this.competition, {super.key});

  final Competition competition;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: competition.isTrophyAcquired ? Colors.green : Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(competition.title),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(competition.competitor),
                const Spacer(),
                Text(competition.rival),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
