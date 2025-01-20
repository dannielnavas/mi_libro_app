import 'package:flutter/material.dart';
import 'package:mi_libro_app/models/book_model.dart';
import 'package:mi_libro_app/providers/books_provider.dart';
import 'package:mi_libro_app/screens/book_detail.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
            backgroundColor: Colors.white,
            body: Consumer<BooksProvider>(
                builder: (context, booksProvider, child) {
              final favoritesBooks = booksProvider.favoriteBook;

              return favoritesBooks.isEmpty
                  ? Center(
                      child: Text('No favorite books found',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontFamily: 'QuickSand')))
                  : ListView.builder(
                      itemCount: favoritesBooks.length,
                      itemBuilder: (context, index) {
                        final book = favoritesBooks[index];
                        FavoriteBookCard(
                          book: book,
                        );
                        return null;
                      });
            })));
  }
}

class FavoriteBookCard extends StatelessWidget {
  final Book book;
  const FavoriteBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetail(booksData: book)));
      },
      child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Text(book.titulo,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontFamily: 'QuickSand')),
              Text(book.autor,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontFamily: 'QuickSand')),
            ],
          )),
    );
  }
}
