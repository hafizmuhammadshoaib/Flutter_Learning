import 'package:first_project/todo.dart';
import 'package:first_project/todo_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: TodoList(),
    ));

class TodoList extends StatefulWidget {
  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  List<Todo> data = [];
  int selectedEditIndex = -1;
  final TextEditingController _controller = TextEditingController(text: "");
  void deleteFromList(int index) {
    setState(() {
      data.remove(data[index]);
    });
  }

  void editFromList(String text, int index) {
    _controller.text = text;
    selectedEditIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Todo List App'),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: <Widget>[
            TextFormField(
              onFieldSubmitted: (text) {
                if (selectedEditIndex > -1) {
                  setState(() {
                    data[selectedEditIndex] = Todo(text: text);
                    selectedEditIndex = -1;
                  });
                } else {
                  setState(() {
                    data.add(Todo(text: text));
                  });
                }
                _controller.clear();
              },
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter Todo'),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoCard(
                  todo: data[index],
                  delete: () {
                    deleteFromList(index);
                  },
                  edit: () {
                    editFromList(data[index].text, index);
                  },
                );
              },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
            ))
          ],
        ));
  }
}
