import 'package:chatapp/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
