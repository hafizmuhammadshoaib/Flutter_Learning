import 'package:first_project/post.dart';
import 'package:first_project/qoute.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  // final Quote quote;
  final Post post;
  QuoteCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(post.body,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
              SizedBox(
                height: 6.0,
              ),
              Text(post.title,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[800]))
            ],
          ),
        ));
  }
}
