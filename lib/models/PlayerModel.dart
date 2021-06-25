import 'package:flutter/material.dart';

class PlayerModel {
  String? name;
  String? country;
  String? playerImage;
  bool? isDarkText;
  List<Color>? gradientColors;
  Map<String, int>? playerStats;
  int? overallStats;
  Map<String, int>? playerPerformance;

  PlayerModel(
      {required this.name,
      required this.playerImage,
      required this.isDarkText,
      required this.country,
      required this.gradientColors,
      required this.playerStats,
      required this.overallStats,
      required this.playerPerformance});
}
