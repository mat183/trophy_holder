import 'package:flutter/material.dart';
import 'package:trophy_holder/models/competition.dart';
import 'package:trophy_holder/widgets/competition/competitions_list.dart';
import 'package:trophy_holder/widgets/competition/new_competition.dart';
import 'package:trophy_holder/data/dummy_data.dart';

class CompetitionsView extends StatefulWidget {
  const CompetitionsView({super.key});

  @override
  State<CompetitionsView> createState() {
    return _CompetitionsViewState();
  }
}

class _CompetitionsViewState extends State<CompetitionsView> {
  void _openAddCompetitionOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewCompetition(onAddCompetition: _addCompetition),
    );
  }

  void _addCompetition(Competition competition) {
    setState(() {
      availableCompetitions.add(competition);
    });
  }

  void _removeCompetition(Competition competition) {
    final int index = availableCompetitions.indexOf(competition);

    setState(() {
      availableCompetitions.remove(competition);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Competition deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            availableCompetitions.insert(index, competition);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No competitions found. Start adding some!'),
    );

    if (availableCompetitions.isNotEmpty) {
      content = CompetitionsList(
        competitions: availableCompetitions,
        onRemoveCompetition: _removeCompetition,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('All competitions'),
        actions: [
          IconButton(
            onPressed: _openAddCompetitionOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: content,
          ),
        ],
      ),
    );
  }
}
