import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final String username;
  final String password;
  const LandingPage({super.key, required this.username, required this.password});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pocence Activity 2'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $username!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text('Your password is: $password', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),

            ElevatedButton(onPressed: () => Navigator.pop(context),
            child: Text('Logout')
            ),

          ],
        ),
      )
    );
  }
}