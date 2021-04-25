import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/model/cart_book.dart';

class CartBookView extends StatelessWidget {
  static String routerName = '/cart_book_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CartBook'),
      ),
      body: Column(
        children: [_ListCartBook(), _BuyView()],
      ),
    );
  }
}

class _BuyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
          child: Text(
        'Price: ${context.watch<CartBookModel>().getAllPriceCart()}',
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}

class _ListCartBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('_ListCartBook: build');

    //TODO: animation remove item listView
    var cartModel = context.watch<CartBookModel>();

    return Expanded(
        child: ListView.builder(
            itemCount: cartModel.listCartBook.length,
            itemBuilder: (context, index) {
              var book = cartModel.listCartBook[index];
              return ListTile(
                  title: Text('${book.nameBook}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      cartModel.removeBook(book);
                    },
                  ));
            }));
  }
}
