import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // todo: check if this first time or not
      //       if already login aka records found on db local, go to home page
      //       if not first time, go to login page,
      //       if first time, go to welcome page,
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo_mhs.png',
        ),
      ),
    );
  }
}
