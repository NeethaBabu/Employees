import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Employee.dart';


class DataProvider with ChangeNotifier {
  List<Employee> _employees = [];

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
    final response = await http.get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final employeesList = data['data'] as List<dynamic>;
      _employees = employeesList.map((e) => Employee.fromJson(e)).toList();
      notifyListeners();
    }
  }
}
