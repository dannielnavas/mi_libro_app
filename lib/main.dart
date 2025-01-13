import 'package:flutter/material.dart';
import 'package:mi_libro_app/screens/home_screen.dart';

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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text(
                'Mi libro app',
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.book),
                    text: 'Libros',
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                    text: 'Autores',
                  )
                ],
              ),
            ),
            body: TabBarView(children: [
              HomeScreen(),
              Center(
                child: Text('Autores'),
              )
            ])));
  }
}
