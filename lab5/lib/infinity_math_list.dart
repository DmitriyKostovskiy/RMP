import 'package:flutter/material.dart';

class InfinityMathList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список степеней 2'),
        backgroundColor: Colors.green, // Устанавливаем зеленый фон для AppBar
      ),
      body: ListView.separated(
        itemCount: 20, // Ограничиваем количество элементов
        itemBuilder: (context, index) {
          return ListTile(title: Text('2 ^ $index = ${1 << index}'));
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

