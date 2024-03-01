import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField without Underline Example'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your text',
                border: OutlineInputBorder( // Tạo border xung quanh TextField
                  borderRadius: BorderRadius.circular(8.0), // Bo tròn border
                  borderSide: BorderSide.none, // Bỏ viền
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    // Xử lý khi nút ấn được nhấn
                    print('Button pressed');
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8), // Bo tròn khối
                    ),
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
