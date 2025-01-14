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
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () => _showBottom(context),
        ));
  }

  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              color: Colors.white,
              child: BookForm(),
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

class BookForm extends StatelessWidget {
  const BookForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
            // key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Add new book',
              style: TextStyle(fontSize: 20, color: Colors.green)),
          SizedBox(height: 20),
          _buildTextField(label: 'Title'),
        ])));
  }

  Widget _buildTextField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.green, fontFamily: 'QuickSand'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green, width: 1.5),
          )),
    );
  }
}
