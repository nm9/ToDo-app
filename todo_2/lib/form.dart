import 'package:flutter/material.dart';
import 'execute.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();
    TimeOfDay _time = TimeOfDay.now();

//for the calendar
    Future selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2016),
          lastDate: new DateTime(2020));
      if (picked != null && picked != _date) {
        print("date selected : ${_date.toString()}");
        setState(() {
          _date = picked;
        });
      }
    }
    //here the calendar ends

    Future selectTime(BuildContext context) async {
      TimeOfDay pick =
          await showTimePicker(context: context, initialTime: _time);
      if (pick != null && pick != _time) {
        print('time selected : ${_time.toString()}');
        setState(() {
          _time = pick;
        });
      }
    }
    String a;
    

    // Build a Form widget using the _formKey created above.
    return Form(
      autovalidate: true,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: "What is your task?",
            ),
            //enabled:false,
            //initialValue: "enter your note here",
            keyboardType: TextInputType.multiline,
            autofocus: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a task';
              }
              a= value;
              return null;
            },
          ),
          /*Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: 
          ),*/
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.calendar_today),
                Text(_date.toString())
              ],
            ),
            onPressed: selectDate,
            color: Colors.white,
          ),
          Divider(indent: 2.0, endIndent: 2.0),
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.access_alarm),
                Text(_date.toString())
              ],
            ),
            onPressed: () {
              selectTime(context);
            },
            color: Colors.white,
          ),
          Positioned(
              bottom: 20,
              child: Container(
                width: double.infinity, // specific value
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                      TodoListState().addTodoItem(a);
                    }
                  },
                  child: Text('Submit'),
                ),
              ))
        ],
      ),
    );
  }
}
