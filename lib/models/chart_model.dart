import 'package:flutter/material.dart';

class ChartModel {
  String year;
  int population;
  Color barColor;
  ChartModel({
    required this.year,
    required this.population,
    required this.barColor,
  });
}

List<ChartModel> chartsData = [
  ChartModel(
    year: 'Jan',
    population: 280,
    barColor: Colors.green,
  ),
  ChartModel(
    year: 'Feb',
    population: 220,
    barColor: Colors.blue,
  ),
  ChartModel(
    year: 'Mar',
    population: 320,
    barColor: Colors.red,
  ),
  ChartModel(
    year: 'Apr',
    population: 130,
    barColor: Colors.green,
  ),
  ChartModel(
    year: 'May',
    population: 50,
    barColor: Colors.blue,
  ),
  ChartModel(
    year: 'Jun',
    population: 400,
    barColor: Colors.red,
  ),
];
