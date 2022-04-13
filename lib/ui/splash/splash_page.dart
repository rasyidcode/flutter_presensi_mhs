import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/ui/login/login_page.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const WelcomePage()));
        },
        child: Center(
          child: Image.asset(
            'assets/logo_mhs.png',
          ),
        ),
      ),
    );
  }
}
