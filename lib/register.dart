import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formstate,
        child: ListView(
          children: <Widget>[
            buildEmailField(),
            buildPasswordField(),
            buildRegisterButton()
          ],
        ),
      ),
    );
  }

  RaisedButton buildRegisterButton() {
    return RaisedButton(
      child: Text("Register"),
      onPressed: () {
        print('Register new acc');
        if (this._formstate.currentState.validate()) {
          // this._formstate.currentState.save();
          print(this.email.text);
          print(this.password.text);
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: password,
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
      controller: email,
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
