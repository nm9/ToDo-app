 /*GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(4),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: <Container>[
              Container(
                  color: Colors.red[300],
                  child: Column(children: <Widget>[
                    Text("Urgent and Important"),
                    Icon(Icons.priority_high),
                    RaisedButton(
                      child: Text('Add Task'),
                      onPressed: _newTask1,
                    )
                  ])),
              Container(
                  color: Colors.amber[300],
                  child: Column(children: <Widget>[
                    Text("Urgent not Important"),
                    Icon(Icons.access_time),
                    RaisedButton(
                      child: Text('Add Task'),
                      onPressed: _newTask2,
                    )
                  ])),
              Container(
                  color: Colors.blue[300],
                  child: Column(children: <Widget>[
                    Text("Important not urgent"),
                    Icon(Icons.notification_important),
                    RaisedButton(
                      child: Text('Add Task'),
                      onPressed: _newTask3,
                    )
                  ])),
              Container(
                  color: Colors.green[300],
                  child: Column(children: <Widget>[
                    Text("Neither Urgent nor Important"),
                    Icon(Icons.low_priority),
                    RaisedButton(
                      child: Text('Add Task'),
                      onPressed: _newTask4,
                    )
                  ])),
            ],
      )*/
          

//form alternative
/*TextField(
          autofocus: true,
          onSubmitted: (val) {
            _addTodoItem(val);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              hintText: 'Enter something to do...',
              contentPadding: const EdgeInsets.all(16.0)),
        ),*/