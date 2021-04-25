import 'package:flutter/material.dart';
import 'package:provider_shop/model/book_source.dart';

class CartBookModel extends ChangeNotifier {
  final List<Book> listCartBook = [];

  void addBook(Book book) {
    listCartBook.add(book);
    notifyListeners();
  }

  void removeBook(Book book) {
    listCartBook.remove(book);
    notifyListeners();
  }

  int getAllPriceCart() => listCartBook.fold(
      0, (previousValue, element) => previousValue + element.price);

  bool bookAddedCart(Book book) => listCartBook.contains(book);
}
