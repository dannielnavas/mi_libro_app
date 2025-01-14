import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _BooksCard(context),
        _BooksCard(context),
      ],
    ));
  }

  Widget _BooksCard(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 125,
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 125,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      // child: Image.asset('alicia.jpg', fit: BoxFit.cover),
                      child: Image.network(
                        'https://images-na.ssl-images-amazon.com/images/I/51Zymoq7UnL._AC_SY400_.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'The Lean Startup',
                        style: TextStyle(fontSize: 20, fontFamily: 'QuickSand'),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Eric Ries',
                        style: TextStyle(fontSize: 15, fontFamily: 'QuickSand'),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '2011',
                        style: TextStyle(fontSize: 15, fontFamily: 'QuickSand'),
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
