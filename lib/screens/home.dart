import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String usr;

  HomeScreen({required this.usr});

  @override
  Widget build(BuildContext context) {
    String welcomeMessage = 'Bienvenido';

    if (usr != null && usr.isNotEmpty) {
      welcomeMessage += ', $usr!';
    } else {
      welcomeMessage += ' ';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Asignación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imagen1.jpg',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 30),
            Text(
              'Segunda Asignación',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              welcomeMessage,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
