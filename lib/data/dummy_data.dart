import 'package:trophy_holder/models/competition.dart';

final List<Competition> availableCompetitions = [
  Competition(
      title: 'Morning Squash',
      competitor: 'Mateusz',
      rival: 'Slawek',
      creationDate: DateTime.now(),
      category: Category.squash,
      isTrophyAcquired: true),
  Competition(
      title: 'Darts with wife <3',
      competitor: 'Mateusz',
      rival: 'Madzia',
      creationDate: DateTime.now(),
      category: Category.dart,
      isTrophyAcquired: false),
];
