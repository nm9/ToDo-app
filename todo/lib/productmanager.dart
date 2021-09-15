import 'package:flutter/material.dart';

import 'products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  ProductManager({this.startingProduct = 'sweetes testeer'}); //constructor
  State<StatefulWidget> createState() {
    return ProductManagerState();
  }
}

class ProductManagerState extends State<ProductManager> {
  List<String> products = []; //array of string named products

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor, //same color as used before
            onPressed: () {
              setState(() {
                products.add('Advanced food tester');
              });
            },
            child: Text("add it"),
          )),
      Products(products)
    ]);
  }

  @override
  void initState() {
    products.add(widget.startingProduct);
    super.initState();
  }
}
