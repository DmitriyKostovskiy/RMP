import 'package:flutter/material.dart';

class InfinityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бесконечный список'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
            child: Text(
              'Элемент $index',
              style: TextStyle(fontSize: 14),
            ),
          );
        },
      ),
    );
  }
}
