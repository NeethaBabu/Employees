import 'package:flutter/material.dart';
import 'Data Provider.dart';
import 'package:provider/provider.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
     dataProvider.fetchEmployees();
var employees=dataProvider.employees;
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return ListTile(
            title: Text(employee.name),
            subtitle: Text('Salary: \$${employee.salary.toStringAsFixed(2)} | Age: ${employee.age}'),
          );
        },
      ),
    );
  }
}