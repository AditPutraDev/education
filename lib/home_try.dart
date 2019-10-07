import 'package:education/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void showLongToast() {
    Fluttertoast.showToast(
      msg: "clicked...",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (currentIndex) {
      case 0:
        child = FlutterLogo();
        break;
      case 1:
        child = FlutterLogo(colors: Colors.orange);
        break;
      case 2:
        child = FlutterLogo(colors: Colors.red);
        break;
      case 3:
        child = ProfilePage();
        break;
    }
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: new AppBar(
        title: new Text('Education'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showLongToast(),
          )
        ],
      ),
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.timeline),
              title: Text('Timeline'),
              activeColor: Colors.orange),
          BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notification'),
              activeColor: Colors.red),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Account'),
              activeColor: Colors.green),
        ],
      ),
    );
  }
}
