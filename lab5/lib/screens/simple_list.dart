import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Простой список'),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(title: Text(index.toString().padLeft(4, '0')));
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
