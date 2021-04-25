import 'package:flutter/material.dart';

class BookSource {
  static final String _imgSource = 'https://sachgiamgia.vn/wp-content/uploads/2013/08/nha-dau-tu-thong-minh-1.jpg';
  static final String _prefixNameBook = 'The Intelligent Investor';

  static Book genBookFromIndex(int index) => Book(
      index, '$_prefixNameBook ' + (index + 1).toString(), _imgSource, 100 + index);
}

class Book {
  final id;
  final nameBook;
  final imageUrl;
  final price;

  Book(this.id, this.nameBook, this.imageUrl, this.price);

  @override
  String toString() => '$id - $nameBook - $price';

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Book && other.id == this.id;
}
