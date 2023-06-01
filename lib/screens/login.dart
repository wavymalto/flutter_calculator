import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loginError = false;
  bool _isLoggedIn = false;
  String _usr = '';

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Simulando una llamada asíncrona para el proceso de inicio de sesión
    await Future.delayed(Duration(seconds: 2));

    // Comprobar si los datos de inicio de sesión son correctos
    if (username == 'raul' && password == '12345') {
      setState(() {
        _isLoggedIn = true;
        _usr = username;
        _loginError = false;
      });
    } else {
      setState(() {
        _loginError = true;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            SizedBox(height: 16.0),
            Text(
              'Usuario',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Usuario',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Contraseña',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Contraseña',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login().then((_) {
                  if (_isLoggedIn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(usr: _usr),
                      ),
                    );
                  }
                });
              },
              child: Text('Login'),
            ),
            if (_loginError)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Error :( : Los datos no son correctos',
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
