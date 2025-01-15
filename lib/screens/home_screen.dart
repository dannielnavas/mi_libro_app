import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mi_libro_app/screens/book_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<dynamic>> fetchBooks() async {
    final url = Uri.parse('http://localhost:3001/books');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data['books'];
  }

  @override
  Widget build(BuildContext context) {
    fetchBooks();
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
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              color: Colors.white,
              child: BookForm(),
            ));
  }

  Widget _BooksCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BookDetail(bookName: 'The Lean Startup')));
      },
      child: Padding(
          padding: const EdgeInsets.all(12),
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
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'QuickSand'),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Eric Ries',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'QuickSand'),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '2011',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'QuickSand'),
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
              ))),
    );
  }
}

class BookForm extends StatelessWidget {
  const BookForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController titleController = TextEditingController();
    final TextEditingController authorController = TextEditingController();
    final TextEditingController imageUrlController = TextEditingController();
    final TextEditingController yearController = TextEditingController();

    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Add new book',
                  style: TextStyle(fontSize: 20, color: Colors.green)),
              SizedBox(height: 20),
              _buildTextField(
                controller: titleController,
                label: 'Book Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              _buildTextField(
                  controller: authorController,
                  label: 'Author',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an author';
                    }
                    return null;
                  },
                  maxLines: 4),
              SizedBox(
                height: 16,
              ),
              _buildTextField(
                  controller: imageUrlController,
                  label: 'Image Url',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image url';
                    }
                    return null;
                  }),
              SizedBox(
                height: 16,
              ),
              _buildTextField(
                  controller: yearController,
                  label: 'Year',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a year';
                    }
                    return null;
                  }),
              SizedBox(
                height: 16,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Save book',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )))
            ])));
  }

  Widget _buildTextField(
      {required String label,
      required TextEditingController controller,
      required String? Function(String?) validator,
      int maxLines = 1}) {
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
      validator: validator,
      maxLines: maxLines,
    );
  }
}
