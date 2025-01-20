import 'package:flutter/material.dart';
import 'package:trophy_holder/models/competition.dart';
import 'package:trophy_holder/widgets/competition/competition_item.dart';

class CompetitionsList extends StatelessWidget {
  const CompetitionsList({
    super.key,
    required this.competitions,
    required this.onRemoveCompetition,
  });

  final List<Competition> competitions;
  final void Function(Competition competition) onRemoveCompetition;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: competitions.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(competitions[index]),
        onDismissed: (direction) => onRemoveCompetition(competitions[index]),
        child: CompetitionItem(competitions[index]),
      ),
    );
  }
}
