import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider_shop/model/book_source.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/model/cart_book.dart';
import 'package:provider_shop/screen/cart_book.dart';

class ListBookView extends StatelessWidget {
  static String routerName = '/list_book_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListBook'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartBookView.routerName);
              })
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
        itemCount: 60,
        itemBuilder: (context, index) =>
            _ItemBook(BookSource.genBookFromIndex(index)),
      ),
    );
  }
}

class _AddCartButton extends StatelessWidget {
  final Book book;

  _AddCartButton(this.book, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('_AddCartButton : $book');

    var isAddedBook = context.select<CartBookModel, bool>((value) {
      return value.bookAddedCart(book);
    });

    return TextButton(
      onPressed: () {
        var cartModel = context.read<CartBookModel>();
        if (isAddedBook) {
          cartModel.removeBook(book);
        } else {
          cartModel.addBook(book);
        }
      },
      child: isAddedBook ? Icon(Icons.done) : Text('ADD'),
    );
  }
}

class _ItemBook extends StatelessWidget {
  final Book book;

  _ItemBook(this.book, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      // memCacheWidth: 100,
                      imageUrl: book.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: Colors.black12),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${book.nameBook}',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Price: ${book.price}',
                  style: TextStyle(color: Colors.black38, fontSize: 14),
                ),
              ],
            )),
            SizedBox(
              width: 4,
            ),
            _AddCartButton(book),
          ],
        ));
  }
}
