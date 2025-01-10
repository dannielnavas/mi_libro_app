import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hola mundo',
        home: MiLibroApp());
  }
}

class MiLibroApp extends StatelessWidget {
  const MiLibroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Mi libro app',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
