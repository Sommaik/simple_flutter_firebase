import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple/add_book.dart';
import 'package:simple/book.dart';
import 'package:simple/example_form_page.dart';
import 'package:simple/googlemap.dart';
import 'package:simple/list_view_post_page.dart';
import 'package:simple/login.dart';
import 'package:simple/register.dart';
import 'simpletab.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: MyHomePage(),
      // home: SimpleTab(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/tab': (context) => SimpleTab(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/exampleform': (context) => ExampleFormPage(),
        '/listviewpost': (context) => ListViewPostPage(),
        '/book': (context) => BookPage(),
        '/addbook': (context) => AddBookPage(),
        '/googlemap': (context) => GoogleMapPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHome();
  }
}

class MyHome extends State<MyHomePage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    readCounter().then((value) {
      setState(() {
        this.count = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home Page"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: buildCountText(),
            ),
            buildMenuButton(context, label: 'Tab', path: '/tab'),
            buildMenuButton(context, label: 'Login', path: '/login'),
            buildMenuButton(context,
                label: 'Example Form', path: '/exampleform'),
            buildMenuButton(context, label: 'List Post', path: '/listviewpost'),
            buildMenuButton(context, label: 'List Book', path: '/book'),
            buildMenuButton(context, label: 'Google Map', path: '/googlemap'),
          ],
        ),
      ),
      floatingActionButton: buildAddButton(),
    );
  }

  FloatingActionButton buildAddButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          this.count++;
          writeCounter(this.count);
        });

        print(this.count);
      },
    );
  }

  RaisedButton buildMenuButton(
    BuildContext context, {
    String label,
    String path,
  }) {
    return RaisedButton(
      child: Text(label),
      onPressed: () {
        print('goto $label with $path');
        Navigator.pushNamed(context, path);
      },
    );
  }

  Text buildCountText() {
    return Text(
      "$count",
      style: TextStyle(fontSize: 20),
    );
  }

  Future<File> writeCounter(int counter) async {
    final directory = await getApplicationDocumentsDirectory();
    final _file = File('${directory.path}/counter.txt');
    return _file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    final directory = await getApplicationDocumentsDirectory();
    final _file = File('${directory.path}/counter.txt');
    try {
      String content = await _file.readAsString();
      return int.parse(content);
    } catch (e) {
      return 0;
    }
  }
}
