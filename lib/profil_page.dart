import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: ListView(
        children: <Widget>[
          headerSection(),
          textSection(),
          buttonSection(),
        ],
      ),
    ));
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text("Lengkapi Data",
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
              icon: Icon(Icons.person, color: Colors.white70),
              hintText: "Nama",
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
              icon: Icon(Icons.school, color: Colors.white70),
              hintText: "Sekolah",
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
              icon: Icon(Icons.cake, color: Colors.white70),
              hintText: "Tanggal Lahir",
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
              icon: Icon(Icons.home, color: Colors.white70),
              hintText: "Alamat",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  buttonSection() {
    return Container(
        child: Column(children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(top: 15),
          child: RaisedButton(
            onPressed: () {},
            elevation: 0.0,
            color: Colors.black26,
            child: Text("Save", style: TextStyle(color: Colors.white70)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ))
    ]));
  }
}
