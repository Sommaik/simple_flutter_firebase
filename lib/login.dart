import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formstate = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formstate,
        child: ListView(
          children: <Widget>[
            buildEmailField(),
            buildPasswordField(),
            buildLoginButton(),
            buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  RaisedButton buildRegisterButton() {
    return RaisedButton(
      child: Text('Register new account'),
      onPressed: () {
        print('go to register page');
        Navigator.pushNamed(context, '/register');
      },
    );
  }

  RaisedButton buildLoginButton() {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () {
        if (this._formstate.currentState.validate()) {
          print('valid form');
          this._formstate.currentState.save();
        } else {
          print('invalid form');
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onSaved: (value) {
        this.password = value;
      },
      validator: (value) {
        if (value.length < 8)
          return 'Password must 8';
        else
          return null;
      },
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      onSaved: (value) {
        this.email = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill in email field';
        } else
          return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        icon: Icon(Icons.email),
        hintText: 'x@x.com',
      ),
    );
  }
}
