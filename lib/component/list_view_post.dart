import 'package:flutter/material.dart';
import 'package:simple/model/post.dart';

class ListViewPost extends StatelessWidget {
  final List<Post> posts;

  ListViewPost({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int position) {
          return ListTile(
            title: Text(posts[position].title),
            subtitle: Text(posts[position].body),
            leading: Text('${posts[position].id}'),
            trailing: Text('${posts[position].userId}'),
          );
        },
      ),
    );
  }
}
