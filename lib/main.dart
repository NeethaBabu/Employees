import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Data Provider.dart';
import 'EmployeeList.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: EmployeeApp(),
    ),
  );
}

class EmployeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeList(),
    );
  }
}

