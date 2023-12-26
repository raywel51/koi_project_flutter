import 'package:flutter/material.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Static Page!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}