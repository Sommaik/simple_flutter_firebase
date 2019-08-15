import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple/component/list_view_post.dart';

import 'model/post.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class ListViewPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPost(http.Client()),
      builder: (BuildContext context, snapshot) {
        return snapshot.hasData
            ? ListViewPost(
                posts: snapshot.data,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Future<List<Post>> fetchPost(http.Client client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts');
    return compute(parsePost, response.body);
  }
}

List<Post> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
