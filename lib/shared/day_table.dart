import 'package:consulting/models/register_model/expert_register_request_model.dart';
import 'package:flutter/material.dart';

class DayTable extends StatelessWidget {
   DayTable({required this.days ,Key? key}) : super(key: key);

   List<Day> days;

   _getDataRows(){
     List<DataRow> list = [];
     
     for(Day day in days){
       list.add(DataRow(cells: []));
     }

   }

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const [
      DataColumn(label: Text('Day')),
      DataColumn(label: Text('From')),
      DataColumn(label: Text('To'))
    ], rows: const [
      DataRow(cells: [
        DataCell(
          Text('Sunday'),
        ),
        DataCell(
          Text('data'),
        ),
        DataCell(
          Text('data'),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          Text('Sunday'),
        ),
        DataCell(
          Text('data'),
        ),
        DataCell(
          Text('data'),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          Text('Sunday'),
        ),
        DataCell(
          Text('data'),
        ),
        DataCell(
          Text('data'),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          Text('Sunday'),
        ),
        DataCell(
          Text('data'),
        ),
        DataCell(
          Text('data'),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          Text('Sunday'),
        ),
        DataCell(
          Text('data'),
        ),
        DataCell(
          Text('data'),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          Text('Sunday'),
        ),
        DataCell(
          Text('data'),
        ),
        DataCell(
          Text('data'),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          Text('Sunday'),
        ),
        DataCell(
          Text('data'),
        ),
        DataCell(
          Text('data'),
        ),
      ]),
    ]);
  }
}
