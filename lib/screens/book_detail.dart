import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final String bookName;
  const BookDetail({super.key, required this.bookName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookName, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
