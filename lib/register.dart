import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _civilStatusController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  void _register() {
    if (_fullnameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _civilStatusController.text.isEmpty ||
        _birthdateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }
    if (_passwordController.text != _confirmController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }
    Navigator.push(context,
     MaterialPageRoute(builder: (context) => LoginPage()
     ),
      );
    }
      InputDecoration _inputdecoration (String labelim, IconData icon){
        return  InputDecoration(
          labelText: labelim,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        );
  }

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Ponce Activity 2'),
       ),

      body: Padding(padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _fullnameController,
            decoration: _inputdecoration('Full Name', Icons.person),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: _usernameController,
            decoration: _inputdecoration('Username', Icons.account_circle),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: _passwordController,
            decoration: _inputdecoration('Password', Icons.lock),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: _confirmController,
            decoration: _inputdecoration('Confirm Password', Icons.lock_outline),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: _genderController,
            decoration: _inputdecoration('Gender', Icons.male_rounded),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: _civilStatusController,
            decoration: _inputdecoration('Civil Status', Icons.people),
          ),
          const SizedBox(height: 15),

          TextField(
            controller: _birthdateController,
            decoration: _inputdecoration('BirthDate', Icons.calendar_today),
            onTap: () async {
              DateTime ? pickdate = await  showDatePicker(context: context,
              initialDate: DateTime(2025),
              firstDate: DateTime(2020),
              lastDate: DateTime.now(),
               );

               if(pickdate != null){
                setState(() {
                  _birthdateController.text = "${pickdate.day}/${pickdate.month}/${pickdate.year}";
                });
               }
            },
          ),
          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: _register,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
             ),
          )
        ],
      ),
      ),


    );
  }
}
