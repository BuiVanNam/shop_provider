import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop/model/cart_book.dart';
import 'package:provider_shop/screen/cart_book.dart';
import 'package:provider_shop/screen/list_book.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartBookModel(),
      child: MaterialApp(
        title: 'ProviderShop',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: ListBookView.routerName,
        routes: {
          ListBookView.routerName: (context) => ListBookView(),
          CartBookView.routerName: (context) => CartBookView(),
        },
      ),
    );
  }
}
