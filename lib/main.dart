import 'package:ecomflutter/dashboard.dart';
import 'package:ecomflutter/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),//FinancialPage() //DashboardScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String validUsername = 'vikash';
  final String validPassword = 'Demo@123';

  String username = '';
  String password = '';

  bool isPasswordVisible = false;
  bool rememberMe = false;

  String errorMessage = '';

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _login() {
    setState(() {
      errorMessage = '';

      if (username.isEmpty && password.isEmpty) {
        errorMessage = 'Please enter login credentials';
      } else if (username.isEmpty) {
        errorMessage = 'Please enter username';
      } else if (password.isEmpty) {
        errorMessage = 'Please enter password';
      } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9]).{8,}$')
          .hasMatch(password)) {
        errorMessage = 'Please enter a valid password';
      } else if (username != validUsername || password != validPassword) {
        errorMessage = 'Invalid username or password';
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Icon(
                Icons.fastfood,
                size: 80,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to the Food App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField('Username', TextInputType.text, (value) {
              setState(() {
                username = value;
              });
            }),
            SizedBox(height: 16),
            _buildPasswordField('Password', TextInputType.text, (value) {
              setState(() {
                password = value;
              });
            }),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                ),
                Text('Remember Me'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextInputType inputType, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 8),
          TextField(
            keyboardType: inputType,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(
      String label, TextInputType inputType, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 8),
          TextField(
            keyboardType: inputType,
            onChanged: onChanged,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
