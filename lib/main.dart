import 'package:flutter/material.dart';
import 'package:plants/plants_page.dart';

void main() {
  runApp(PlantsApp());
}

class PlantsApp extends StatefulWidget {
  @override
  _PlantsAppState createState() => _PlantsAppState();
}

class _PlantsAppState extends State<PlantsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlantsPage(),
    );
  }
}
