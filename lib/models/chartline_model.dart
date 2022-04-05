import 'package:flutter/material.dart';

class ChartLineModel {
  DateTime year;
  int population;
  Color barColor;
  ChartLineModel({
    required this.year,
    required this.population,
    required this.barColor,
  });
}

List<ChartLineModel> chartslineData = [
  ChartLineModel(
    year: new DateTime(2022, 3, 31),
    population: 60,
    barColor: Colors.green,
  ),
  ChartLineModel(
    year: new DateTime(2022, 4, 3),
    population: 45,
    barColor: Colors.blue,
  ),
  ChartLineModel(
    year: new DateTime(2022, 4, 10),
    population: 60,
    barColor: Colors.red,
  ),
  ChartLineModel(
    year: new DateTime(2022, 4, 25),
    population: 110,
    barColor: Colors.green,
  ),
  ChartLineModel(
    year: new DateTime(2022, 5, 1),
    population: 60,
    barColor: Colors.green,
  ),
  ChartLineModel(
    year: new DateTime(2022, 5, 10),
    population: 30,
    barColor: Colors.green,
  ),
  ChartLineModel(
    year: new DateTime(2022, 6, 1),
    population: 70,
    barColor: Colors.green,
  ),
];
