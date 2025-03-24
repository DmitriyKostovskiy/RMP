import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AreaCalculator(),
  ));
}

class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите значение';
    }
    final num? number = num.tryParse(value);
    if (number == null) {
      return 'Введите числовое значение';
    }
    if (number <= 0) {
      return 'Введите положительное число';
    }
    return null;
  }

  void _calculateArea() {
    if (_formKey.currentState!.validate()) {
      double width = double.parse(_widthController.text);
      double height = double.parse(_heightController.text);
      double area = width * height;

      setState(() {
        _result = 'S = $width * $height = $area';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Вычисление успешно: $_result'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Калькулятор площади')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ширина:', style: TextStyle(fontSize: 18.0)),
              TextFormField(
                controller: _widthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: _validateInput,
              ),
              SizedBox(height: 10),
              Text('Высота:', style: TextStyle(fontSize: 18.0)),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder()),
                validator: _validateInput,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateArea,
                child: Text('Вычислить'),
              ),
              SizedBox(height: 20),
              Text(_result, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
