import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Avatar Demo'),
        ),
        body: Center(
          child: Container(
            width: 200, // Kích thước cố định của hình tròn bao bên ngoài
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Thiết lập hình dạng là hình tròn
              border: Border.all(
                color: Colors.blue, // Màu viền của hình tròn
                width: 2.0, // Độ dày của viền
              ),
            ),
            child: ClipOval(
              child: Image.network(
                'https://example.com/your-image.jpg', // URL của ảnh đại diện
                fit: BoxFit.cover,
                width: 200, // Kích thước của ảnh bên trong
                height: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
