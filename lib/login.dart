import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formstate = GlobalKey<FormState>();
  String email;
  String password;
  final auth = FirebaseAuth.instance;

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
          this._formstate.currentState.save();
          this
              .auth
              .signInWithEmailAndPassword(
                  email: this.email, password: this.password)
              .then((user) {
            if (user.isEmailVerified) {
              Scaffold.of(this._formstate.currentContext)
                  .showSnackBar(SnackBar(content: Text("Login passs")));
            } else {
              Scaffold.of(this._formstate.currentContext).showSnackBar(
                  SnackBar(content: Text("Please verified your email")));
            }
          }).catchError((reason) {
            Scaffold.of(this._formstate.currentContext)
                .showSnackBar(SnackBar(content: Text("Login fail")));
          });
          // try {
          //   FirebaseUser user = await this.auth.signInWithEmailAndPassword(
          //       email: this.email, password: this.password);
          //   if (user.isEmailVerified) {
          //     Scaffold.of(this._formstate.currentContext)
          //         .showSnackBar(SnackBar(content: Text("Login passs")));
          //   } else {
          //     Scaffold.of(this._formstate.currentContext).showSnackBar(
          //         SnackBar(content: Text("Please verified your email")));
          //   }
          // } catch (e) {
          //   Scaffold.of(this._formstate.currentContext)
          //       .showSnackBar(SnackBar(content: Text("Login fail")));
          // }
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
