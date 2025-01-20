import 'package:flutter/material.dart';
import 'package:mi_libro_app/models/book_model.dart';
import 'package:mi_libro_app/providers/books_provider.dart';
import 'package:provider/provider.dart';

class BookDetail extends StatefulWidget {
  final Book booksData;
  const BookDetail({super.key, required this.booksData});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  bool isFavorite = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isFavorite = Provider.of<BooksProvider>(context, listen: false)
        .favoriteBook
        .contains(widget.booksData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.booksData.titulo,
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey<bool>(isFavorite), color: Colors.redAccent),
            ),
            // icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
            //     color: Colors.white),
            onPressed: () async {
              await Provider.of<BooksProvider>(context, listen: false)
                  .toggleFavoriteStatus(widget.booksData);
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Image.network(widget.booksData.portada, height: 400),
            Text(widget.booksData.titulo,
                style: TextStyle(fontSize: 20, color: Colors.green)),
            Text("by: ${widget.booksData.autor}",
                style: TextStyle(fontSize: 20)),
            Text(widget.booksData.anho.toString(),
                style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
