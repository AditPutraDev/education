import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: TextFormField(),
        ),
        SizedBox(height: 20),
        Container(
          child: TextFormField()
        )
      ],
    );
  }
}
