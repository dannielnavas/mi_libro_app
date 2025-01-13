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
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 125,
            child: Card(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 125,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://images-na.ssl-images-amazon.com/images/I/51Zymoq7UnL._AC_SY400_.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: <Widget>[
                      Text(
                        'The Lean Startup',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Eric Ries',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '2011',
                        style: TextStyle(fontSize: 15),
                      ),
                      Container(
                        height: 2,
                        width: 75,
                        color: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
