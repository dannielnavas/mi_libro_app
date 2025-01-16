import 'package:flutter/material.dart';
import 'package:mi_libro_app/models/book_model.dart';

class BooksProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Book> books = [];

  Future<void> fetchBooks() async {
    isLoading = true;
    notifyListeners();
    books = List<Book>.from([
      {
        "titulo": "Cien años de soledad",
        "autor": "Gabriel García Márquez",
        "portada": "https://m.media-amazon.com/images/I/81af+MCATTL.jpg",
        "anho": 1967
      },
      {
        "titulo": "1984",
        "autor": "George Orwell",
        "portada": "https://m.media-amazon.com/images/I/81af+MCATTL.jpg",
        "anho": 1949
      },
      {
        "titulo": "Orgullo y prejuicio",
        "autor": "Jane Austen",
        "portada": "https://m.media-amazon.com/images/I/81WcnNQ-TBL.jpg",
        "anho": 1813
      },
      {
        "titulo": "El señor de los anillos",
        "autor": "J.R.R. Tolkien",
        "portada": "https://m.media-amazon.com/images/I/91b0C2YNSrL.jpg",
        "anho": 1954
      },
      {
        "titulo": "Don Quijote de la Mancha",
        "autor": "Miguel de Cervantes",
        "portada": "https://m.media-amazon.com/images/I/91b0C2YNSrL.jpg",
        "anho": 1605
      }
    ].map((book) => Book.fromJson(book)));

    isLoading = false;
    notifyListeners();
  }
}
