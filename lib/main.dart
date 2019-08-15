import 'package:flutter/material.dart';
import 'package:simple/example_form_page.dart';
import 'package:simple/login.dart';
import 'package:simple/register.dart';
import 'simpletab.dart';

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
        // '/postview': (context) =>
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
            buildTabButton(context),
            buildLoginButton(context),
            buildExampleFormButton(context)
          ],
        ),
      ),
      floatingActionButton: buildAddButton(),
    );
  }

  RaisedButton buildExampleFormButton(BuildContext context) {
    return RaisedButton(
      child: Text("Example Form"),
      onPressed: () {
        print("Go to example form");
        Navigator.pushNamed(context, '/exampleform');
      },
    );
  }

  FloatingActionButton buildAddButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        setState(() {
          this.count++;
        });

        print(this.count);
      },
    );
  }

  RaisedButton buildLoginButton(BuildContext context) {
    return RaisedButton(
      child: Text('Login Page'),
      onPressed: () {
        print('go to login page');
        Navigator.pushNamed(context, '/login');
      },
    );
  }

  RaisedButton buildTabButton(BuildContext context) {
    return RaisedButton(
      child: Text('Test'),
      onPressed: () {
        print('test');
        Navigator.pushNamed(context, '/tab');
      },
    );
  }

  Text buildCountText() {
    return Text(
      "$count",
      style: TextStyle(fontSize: 20),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Home Page"),
//       ),
//       body: Text("$count"),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           this.count = this.count + 1;
//           print(this.count);
//         },
//       ),
//     );
//   }
// }
