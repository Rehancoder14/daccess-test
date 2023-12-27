import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  const DataTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Command'),
          Text('activity date'),
          Text('Thought of the day'),
        ]),
      ),
    );
  }
}
