
import 'package:flutter/material.dart';


import 'execute.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonColor: Theme.of(context).accentColor,
        canvasColor: Colors.blueGrey,
        primarySwatch: Colors.blue,
        accentColor: Colors.blue[800]
      ),
      title: 'Todo List',
      home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => TodoListState();
}

