import 'dart:convert';
// import 'dart:js';

import 'package:first_project/post.dart';
import 'package:first_project/qoute.dart';
import 'package:first_project/quote_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: DataList(),
    ));

class DataList extends StatefulWidget {
  @override
  _DataList createState() => _DataList();
}

class _DataList extends State<DataList> {
  Future<Post> post;
  Future<List<Post>> posts;
  List<Post> _posts = [];
  bool isProgress = false;
  @override
  void initState() {
    super.initState();
    // post = fetchPost();
    setState(() {
      isProgress = true;
    });
    fetchPosts().then((value) {
      setState(() {
        _posts = value;
        isProgress = false;
      });
    });
  }

  Future<Post> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/2');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.

      return (json.decode(response.body) as List)
          .map((i) => Post.fromJson(i))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }



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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isProgress
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: CircularProgressIndicator(),
                    )
                  ],
                )
              : Row(),
          Expanded(
              child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (BuildContext context, int index) {
              return QuoteCard(post: _posts[index]);
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
          )),
        ],
      ),
    );
  }
}
