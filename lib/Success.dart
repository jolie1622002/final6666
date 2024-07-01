import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/start_screen.dart';

import 'notificationssss.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2200), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NotificationPage();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Material(
      child: Image.asset('lib/assets/login_checkmark.png'),
        );
  }
}
