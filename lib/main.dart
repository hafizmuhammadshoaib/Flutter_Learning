import 'package:first_project/qoute.dart';
import 'package:first_project/quote_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: DataList(),
    ));

class DataList extends StatefulWidget {
  @override
  _DataList createState() => _DataList();
}

class _DataList extends State<DataList> {
  List<Quote> data = [
    Quote(text: "Failure is a word unknown to me.", author: "M. Ali Jinnah"),
    Quote(
        text: "Expect the best, Prepare for the worst.",
        author: "M. Ali Jinnah"),
    Quote(
        text:
            "No struggle can ever succeed without women participating side by side with men.",
        author: "M. Ali Jinnah"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('List'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
          children: data
              .map((v) => QuoteCard(
                    quote: v,
                  ))
              .toList()),
    );
  }
}
