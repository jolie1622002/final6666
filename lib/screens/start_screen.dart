import 'package:flutter/material.dart';

import '../components/button_com.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Start App.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ButtonComponent(
                () => Navigator.pushNamed(context, 'LoginScreen'),
                buttonName: 'Login',
                buttonWidth: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
