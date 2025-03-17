import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Второй экран'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Да'),
              child: Text('Да'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Нет'),
              child: Text('Нет'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
