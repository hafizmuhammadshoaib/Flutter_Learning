import 'package:first_project/todo.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final Function delete;
  final Function edit;
  TodoCard({this.todo, this.delete, this.edit});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(todo.text,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: delete,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                    label: Text('Delete'),
                  ),
                  FlatButton.icon(
                    onPressed: edit,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue[200],
                    ),
                    label: Text('Edit'),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
