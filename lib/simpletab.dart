import 'package:flutter/material.dart';

class SimpleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("simple tab"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("One"),
              ),
              Tab(
                child: Text("Two"),
              ),
              Tab(
                child: Text("Three"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.add),
            Icon(Icons.home),
            Icon(Icons.access_time),
          ],
        ),
      ),
    );
  }
}
