import 'package:chatapp/Screens/Auth/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      print('User is currently signed out!');
      return Authenticate();
    } else {
      print('User is signed in!');
      return Home();
    }
  }
}
