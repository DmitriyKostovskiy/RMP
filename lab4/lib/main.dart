import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(DormitoriesApp());
}

class DormitoriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DormitoryScreen(),
    );
  }
}

class DormitoryScreen extends StatefulWidget {
  @override
  _DormitoryScreenState createState() => _DormitoryScreenState();
}

class _DormitoryScreenState extends State<DormitoryScreen> {
  bool isLiked = false;
  int likeCount = 0;
  final String phoneNumber = "+7 123 456 7890";
  final String address = "Краснодар, ул. Калинина, 13";
  final String shareText = "Студенческий городок Кубанского ГАУ состоит из 20 общежитий...";

  void copyToClipboard(String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ОБЩЕЖИТИЯ КУБГАУ', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://sun9-40.userapi.com/s/v1/ig2/m8wRvQ70t4diy--ngylsjzqPH0Q0zKd_zXn2MDsAG7jW6_HqWtmFZS9vQ-jA2h6Ybe842VvvBt7WkXUWPvdXymqG.jpg?quality=95&as=32x23,48x34,72x51,108x77,160x114,240x171,360x257,480x343,540x385,640x457,720x514,1080x771,1280x913,1435x1024&from=bu&u=vkdmz6YeWjWtphWD_EJyCAmvnI8spNDZd83OvRNVUpU&cs=604x431',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Общежитие №20', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(address, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                      onPressed: toggleLike,
                    ),
                    Text('$likeCount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildClipboardButton(Icons.phone, "Позвонить", phoneNumber, "Номер скопирован"),
                _buildClipboardButton(Icons.navigation, "Маршрут", address, "Адрес скопирован"),
                _buildClipboardButton(Icons.share, "Поделиться", shareText, "Текст скопирован"),
              ],
            ),
        SizedBox(height: 16),
        // Новый блок текста
        Text(
          'Студенческий городок или так называемый кампус Кубанского ГАУ состоит '
              'из двадцати общежитий, в которых проживает более 8000 студентов, что состав '
              'ляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в об '
              'щежитии полностью. В соответствии с Положением о студенческих общежитиях '
              'университета, при поселении между администрацией и студентами заключается '
              'договор найма жилого помещения. Воспитательная работа в общежитиях направ '
              'лена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия '
              'асоциальных явлений в молодежной среде. Условия проживания в общежитиях '
              'университетского кампуса полностью отвечают санитарным нормам и требова '
              'ниям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных за '
              'лов, комнат самоподготовки, помещений для заседаний студенческих советов и '
              'наглядной агитации. С целью улучшения условий быта студентов активно работает '
              'система студенческого самоуправления - студенческие советы организуют всю ра '
              'боту по самообслуживанию.',
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
          ],
        ),
      ),
    );
  }

  Widget _buildClipboardButton(IconData icon, String label, String text, String message) {
    return GestureDetector(
      onTap: () => copyToClipboard(text, message),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.green, size: 30),
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
