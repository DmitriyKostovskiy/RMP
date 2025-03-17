import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AreaCalculator(),
  ));
}

class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String _result = "";

  void _calculateArea() {
    if (_formKey.currentState!.validate()) {
      double width = double.parse(widthController.text);
      double height = double.parse(heightController.text);
      double area = width * height;

      setState(() {
        _result = "S = $width * $height = $area";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Форма успешно заполнена'),
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
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ширина:', style: TextStyle(fontSize: 20.0)),
              TextFormField(
                controller: widthController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите ширину';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Введите число';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Text('Высота:', style: TextStyle(fontSize: 20.0)),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите высоту';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Введите число';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _calculateArea,
                child: Text('Вычислить'),
              ),
              SizedBox(height: 20.0),
              Text(
                _result,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}