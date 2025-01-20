import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { squash, videoGames, dart }

const categoryIcons = {
  Category.squash: Icons.sports_tennis,
  Category.videoGames: Icons.sports_esports,
  Category.dart: Icons.sports_handball,
};

class Competition {
  Competition({
    required this.title,
    required this.competitor,
    required this.rival,
    required this.creationDate,
    required this.category,
    required this.isTrophyAcquired,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String competitor;
  final String rival;
  final DateTime creationDate;
  final Category category;
  final bool isTrophyAcquired;

  String get formattedCreationDate {
    return dateFormatter.format(creationDate);
  }
}
