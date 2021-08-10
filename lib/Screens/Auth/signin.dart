import 'package:chatapp/Services/auth.dart';
import 'package:chatapp/screensize.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _authenticate = new Auth();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight(context, dividedBy: 1.7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow[50],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'Email', border: InputBorder.none),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Provide an Email';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'Password', border: InputBorder.none),
                            validator: (val) {
                              if (val!.length < 6) {
                                return 'Enter at least 6 characters';
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        TextButton(
                          child: Text('Sign In'),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _authenticate.signInWithEmailPassword(
                                  _email, _password);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Not a member?'),
                            TextButton(
                                onPressed: () {
                                  widget.toggleView();
                                },
                                child: Text('Sign Up'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sign.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
