import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookPage extends StatelessWidget {
  final store = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: store.collection('books').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Books"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => print("add icon press"),
              )
            ],
          ),
          body: snapshot.hasData
              ? buildBookList(snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }

  ListView buildBookList(QuerySnapshot data) {
    return ListView.builder(
      itemCount: data.documents.length,
      itemBuilder: (BuildContext context, int index) {
        var model = data.documents.elementAt(index);
        return ListTile(
          title: Text(model['title']),
          subtitle: Text(model['detail']),
          trailing: Text("${model['price']}"),
        );
      },
    );
  }
}
