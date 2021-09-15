import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'form.dart';
import 'main.dart';

class TodoListState extends State<TodoList> {
  List<String> todoItems = [];
  List<int> numbers = [2,1,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0];
  int selector;

  Widget build(BuildContext context) {
    int i = -1;
    Container elements(int) {
      i = i + 1;
      var now = (DateTime.now());
      var now2 = now.add(new Duration(days: i));
      return Container(
        child: FlatButton(
            onPressed: () {
              /*Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SecondScreen()),
              );*/
            },
            child: Text(
              DateFormat.MMMd().format(now2),
              //now2.day.toString()+"/"+now2.month.toString(),
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text('Tasks'), centerTitle: true),
        backgroundColor: Colors.grey[100],
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.note_add),
          tooltip: 'Add a new task',
          onPressed: () {
            pushAddTodoScreen();
          },
        ),
        body: Column(
          children: <Widget>[
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical:5.0),
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //width: MediaQuery.of(context).size.width * 0.15,
                      child: Card(
                          shape: CircleBorder(),
                          color: Colors.blue,
                          child: elements(index)),
                    );
                  }),
            ),
            buildTodoList(),
          ],
        ));
  }

  void addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => todoItems.add(task)); //writing new task
    }
  }

  Widget buildTodoItem(String todoText, int index) {
    return GestureDetector(
      child: ListTile(title: Text(todoText)),
      onHorizontalDragEnd: (context) {
        promptRemoveTodoItem(index);
      },
    );
  }

  Widget buildTodoList() {
    return StreamBuilder<Object>(
        stream: Firestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading....');
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index < todoItems.length) {
                return buildTodoItem(todoItems[index], index);
              }
            },
          );
        });
  }

  Color getColor(int selector) {
    if (selector % 4 == 0) {
      return Colors.red[300];
    } else if (selector % 4 == 1) {
      return Colors.amber[300];
    } else if (selector % 4 == 2) {
      return Colors.blue[300];
    } else if (selector % 4 == 3) {
      return Colors.green[300];
    }
  }

  MyCustomForm getform() {
    MyCustomForm form;
    return form;
  }

  void newTask() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text("What's your task?")),
        backgroundColor: getColor(selector),
        body: getform(),
      );
    }));
  }

  void promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Mark "${todoItems[index]}" as done?'),
              actions: <Widget>[
                FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                    child: Text('MARK AS DONE'),
                    onPressed: () {
                      removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  void pushAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //multipage app, transfers to new page
      return Scaffold(
          appBar: AppBar(title: Text('Add a  task')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Card(
                      color: Colors.red[300],
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          getColor(0);
                          newTask();
                        },
                        child: Container(
                          width: 300,
                          height: 100,
                          child: Text('A card that can be tapped'),
                        ),
                      ),
                    ), /*Card(
                        color: Colors.red[300],
                        child: Column(children: <Widget>[
                          Text("Urgent and Important"),
                          Icon(Icons.priority_high),
                          RaisedButton(
                            shape: CircleBorder(),
                            child: Icon(Icons.add),
                            onPressed: () {
                              getColor(0);
                              newTask();
                            },
                          )
                        ])),*/
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Card(
                        color: Colors.amber[300],
                        child: Column(children: <Widget>[
                          Text("Urgent not Important"),
                          Icon(Icons.access_time),
                          RaisedButton(
                            shape: CircleBorder(),
                            child: Icon(Icons.add),
                            onPressed: () {
                              getColor(1);
                              newTask();
                            },
                          )
                        ])),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Card(
                        color: Colors.blue[300],
                        child: Column(children: <Widget>[
                          Text("Important not urgent"),
                          Icon(Icons.notification_important),
                          RaisedButton(
                            shape: CircleBorder(),
                            child: Icon(Icons.add),
                            onPressed: () {
                              getColor(2);
                              newTask();
                            },
                          )
                        ])),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Card(
                        color: Colors.green[300],
                        child: Column(children: <Widget>[
                          Text("Neither Urgent nor Important"),
                          Icon(Icons.low_priority),
                          RaisedButton(
                            shape: CircleBorder(),
                            child: Icon(Icons.add),
                            onPressed: () {
                              getColor(3);
                              newTask();
                            },
                          )
                        ])),
                  ),
                ],
              ),
            ],
          ));
    }));
  }

  void removeTodoItem(int index) {
    setState(() => todoItems.removeAt(index));
  }
}
