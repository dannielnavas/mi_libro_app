import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                      child: Text(
                          AppLocalizations.of(context)!.noFavoriteBooksFound,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontFamily: 'QuickSand')))
                  : ListView.builder(
                      itemCount: favoritesBooks.length,
                      itemBuilder: (context, index) {
                        final book = favoritesBooks[index];
                        return FavoriteBookCard(
                          book: book,
                        );
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
      child: Semantics(
        label: 'Book card',
        hint: 'Double tap to see the book detail ${book.titulo}',
        child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(book.portada, height: 200),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(book.titulo,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontFamily: 'QuickSand')),
                          Text(book.autor,
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'QuickSand')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
