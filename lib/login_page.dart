import 'package:flutter/material.dart';

import 'profile_.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _signInWithEmailAndPassword() async {
    // Replace this with your authentication logic.
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;

    if (email == 'yaseen@gmail.com' && password == 'yaseen') {
      // Authentication successful, navigate to the profile page.
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => profile()),
        );
      };    }
    else {
      setState(() {
        // Authentication failed, display an error message.
        _errorMessage = 'Invalid email or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
