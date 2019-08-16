import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/add_book.dart';
import 'package:simple/bloc/counter/counter_bloc.dart';
import 'package:simple/bloc_counter.dart';
import 'package:simple/book.dart';
import 'package:simple/example_form_page.dart';
import 'package:simple/googlemap.dart';
import 'package:simple/landing_page.dart';
import 'package:simple/list_view_post_page.dart';
import 'package:simple/login.dart';
import 'package:simple/register.dart';
import 'simpletab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: buildMaterialApp(),
      providers: <BlocProvider>[
        BlocProvider<CounterBloc>(
          builder: (BuildContext ctx) => CounterBloc(),
        ),
      ],
    );
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/tab': (context) => SimpleTab(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/exampleform': (context) => ExampleFormPage(),
        '/listviewpost': (context) => ListViewPostPage(),
        '/book': (context) => BookPage(),
        '/addbook': (context) => AddBookPage(),
        '/googlemap': (context) => GoogleMapPage(),
        '/bloccounter': (context) => BlocCounterPage(),
      },
    );
  }
}
