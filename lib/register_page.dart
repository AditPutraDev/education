import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();
  String email, username, password;

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    Map dataForm = {'email': email, 'username': username, 'password': password};
    final response = await http
        .post("http://comic.id/api-ecourse/user/register.php", body: dataForm);
    final data = jsonDecode(response.body);
    int id = data['id'];
    String message = data['message'];
    if (id == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _key,
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              headerSection(),
              textSection(),
              buttonSection(),
            ],
          )),
    ));
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text("Register",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40,
              fontWeight: FontWeight.bold)),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: <Widget>[
          TextFormField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Email",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.white70),
              hintText: "Username",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            obscureText: true,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Container buttonSection() {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(top: 15),
            child: RaisedButton(
              onPressed: () {
                check();
              },
              elevation: 0.0,
              color: Colors.black26,
              child: Text("Register", style: TextStyle(color: Colors.white70)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            )),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(top: 15),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              elevation: 0.0,
              color: Colors.black26,
              child: Text("Main Launcher",
                  style: TextStyle(color: Colors.white70)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            )),
      ],
    ));
  }
}
