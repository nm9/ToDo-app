import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Products extends StatelessWidget {
  List<String> todoItems;

  Products(this.todoItems);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: Firestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading....');
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index < todoItems.length) {
                return buildProductItem(context, index);
              }
            },
            itemCount: todoItems.length,
          );
        });
  }

  Widget buildProductItem(BuildContext context, int index) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset('assets/fifth.jpg'),
        Text(todoItems[index])
      ],
    ));
  }
}
