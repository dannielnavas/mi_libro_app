import 'package:flutter/material.dart';
import 'package:mi_libro_app/providers/books_provider.dart';
import 'package:mi_libro_app/screens/book_detail.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Future<List<dynamic>> fetchBooks() async {
  // android 10.0.2.2
  // ios 127.0.0.1
  // final url = Uri.parse('http://localhost:3001/books');
  // try {
  // final response = await http.get(url);
  // if (response.statusCode == 200) {
  //   final data = jsonDecode(response.body);
  //   return data['books'];
  // } else {
  //   print('Error ${response.statusCode}');
  //   return [];
  // }
  // } catch (e) {
  //   print('Error request');
  //   return [];
  // }
  //   return [
  //     {
  //       "titulo": "Cien años de soledad",
  //       "autor": "Gabriel García Márquez",
  //       "portada": "https://m.media-amazon.com/images/I/81af+MCATTL.jpg",
  //       "anho": 1967
  //     },
  //     {
  //       "titulo": "1984",
  //       "autor": "George Orwell",
  //       "portada": "https://m.media-amazon.com/images/I/81af+MCATTL.jpg",
  //       "anho": 1949
  //     },
  //     {
  //       "titulo": "Orgullo y prejuicio",
  //       "autor": "Jane Austen",
  //       "portada": "https://m.media-amazon.com/images/I/81WcnNQ-TBL.jpg",
  //       "anho": 1813
  //     },
  //     {
  //       "titulo": "El señor de los anillos",
  //       "autor": "J.R.R. Tolkien",
  //       "portada": "https://m.media-amazon.com/images/I/91b0C2YNSrL.jpg",
  //       "anho": 1954
  //     },
  //     {
  //       "titulo": "Don Quijote de la Mancha",
  //       "autor": "Miguel de Cervantes",
  //       "portada": "https://m.media-amazon.com/images/I/91b0C2YNSrL.jpg",
  //       "anho": 1605
  //     }
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    // fetchBooks();
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);
    booksProvider.fetchBooks();
    return Scaffold(
        body: Consumer<BooksProvider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (provider.books.isEmpty) {
            return Center(
                child: Text('No books found',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontFamily: 'QuickSand')));
          }

          return ListView.builder(
              itemCount: provider.books.length,
              itemBuilder: (context, index) {
                return _BooksCard(context, provider.books[index]);
              });
        }),
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

  Widget _BooksCard(BuildContext context, dynamic book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetail(bookName: book.titulo)));
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
                          book!.portada.toString(),
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
                          book?.titulo,
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'QuickSand'),
                        ),
                        SizedBox(height: 4),
                        Text(
                          book?.autor,
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'QuickSand'),
                        ),
                        SizedBox(height: 4),
                        Text(
                          book.anho.toString(),
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
