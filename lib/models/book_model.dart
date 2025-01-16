class Book {
  final String titulo;
  final String autor;
  final String portada;
  final int anho;

  Book({
    required this.titulo,
    required this.autor,
    required this.portada,
    required this.anho,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      titulo: json['titulo'],
      autor: json['autor'],
      portada: json['portada'],
      anho: json['anho'],
      // para listas List<String>.from(json['listas']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'autor': autor,
      'portada': portada,
      'anho': anho,
    };
  }

  @override
  String toString() {
    return 'Book{titulo: $titulo, autor: $autor, portada: $portada, anho: $anho}';
  }
}
