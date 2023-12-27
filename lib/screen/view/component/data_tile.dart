import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String command;
  final String activityDate;
  final String thought;
  final String aLink;
  final String bLink;
  const DataTile(
      {super.key,
      required this.command,
      required this.activityDate,
      required this.thought,
      required this.aLink,
      required this.bLink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        elevation: 2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('$command'),
            Text('$activityDate'),
            Text('$thought'),
          ]),
        ),
      ),
    );
  }
}
