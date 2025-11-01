import 'package:flutter/material.dart';
import 'landing.dart';
import 'register.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _login(){
    String username = _usernameController.text;
    String password = _passwordController.text;

    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage(
      username: username,
      password: password,
    )));
  }
  void _gotoRegister(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(
      )));
    } 
  Widget build(BuildContext context) {
   final ButtonStyle buttonstyle = ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

   );
   return Scaffold(
    appBar: AppBar(
      title: const Text('Ponce Activity 2'),
    ),
    body : Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _login, style: buttonstyle.copyWith(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              foregroundColor: WidgetStateProperty.all(Colors.white)
            ),
            child: const Text('Login'),
            ),

            const SizedBox(height: 10),
             ElevatedButton(onPressed: _gotoRegister, style: buttonstyle.copyWith(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              side: WidgetStateProperty.all(const BorderSide(color: Colors.blue, width: 2),
            ),
            ),
            child: const Text('Register'),
             ),
          ],
        ),
      ),
    ) ,
   );
  }
}