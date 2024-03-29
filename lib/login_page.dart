import 'dart:convert';

import 'package:education/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool onLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: onLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  headerSection(),
                  textSection(),
                  buttonSection(),
                ],
              ),
      ),
    );
  }

  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    var jsonResponse;
    var response = await http.post("http://comic.id/api-ecourse/user/login.php",
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          onLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MainPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        onLoading = false;
      });
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                onPressed: emailController.text == "" ||
                        passwordController.text == ""
                    ? null
                    : () {
                        setState(() {
                          onLoading = true;
                        });
                        signIn(emailController.text, passwordController.text);
                      },
                elevation: 0.0,
                color: Colors.blue,
                child: Text("Sign In", style: TextStyle(color: Colors.white70)),
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
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                elevation: 0.0,
                color: Colors.transparent,
                child:
                    Text("Register", style: TextStyle(color: Colors.white70)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ))
        ],
      ),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
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
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
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

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text("Education",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40,
              fontWeight: FontWeight.bold)),
    );
  }
}
