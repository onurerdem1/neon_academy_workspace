import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({super.key});

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  List passengers = [
    Info(
        name: "Onur",
        surname: "Erdem",
        team: "Flutter Team",
        age: 23,
        homeTown: "Istanbul",
        mail: "onur@hotmail.com"),
    Info(
        name: 'Bob',
        surname: 'Johnson',
        team: 'iOS Team',
        age: 30,
        homeTown: 'San Francisco',
        mail: 'bob@example.com'),
    Info(
        name: 'Charlie',
        surname: 'Brown',
        team: 'Android Team',
        age: 28,
        homeTown: 'Chicago',
        mail: 'charlie@example.com'),
    Info(
        name: 'Diana',
        surname: 'Prince',
        team: 'Design Team',
        age: 24,
        homeTown: 'Los Angeles',
        mail: 'diana@example.com'),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Team")),
            DataColumn(label: Text("Age")),
          ],
          rows: passengers.map((passenger) {
            return DataRow(cells: [
              DataCell(
                Text("${passenger.name} ${passenger.surname}"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(passenger: passenger)));
                },
              ),
              DataCell(Text(passenger.team)),
              DataCell(Text(passenger.age.toString())),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  Info passenger;
  DetailScreen({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${passenger.name} ${passenger.surname}"),
            Text("Team: ${passenger.team}"),
            Text("Age: ${passenger.age}"),
            Text("Home Town: ${passenger.homeTown}"),
            Text("Mail: ${passenger.mail}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"))
          ],
        ),
      ),
    );
  }
}

class Info {
  String name;
  String surname;
  String team;
  int age;
  String homeTown;
  String mail;
  Info(
      {required this.name,
      required this.surname,
      required this.team,
      required this.age,
      required this.homeTown,
      required this.mail});
}
