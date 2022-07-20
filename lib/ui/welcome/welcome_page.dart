import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/login/login_page.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_bloc.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_event.dart';
import 'package:kiwi/kiwi.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomeBloc _welcomeBloc = KiwiContainer().resolve<WelcomeBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _welcomeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/logo_mhs.png',
            ),
            const SizedBox(height: 8.0),
            Text(
              'Aplikasi Presensi Mahasiswa',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Selamat Datang Di Aplikasi Presensi Mahasiswa QRCode STMIK ADHI GUNA PALU',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryButtonColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 120.0,
                  vertical: 4.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                _welcomeBloc.add(CreateFirstTime());
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage()));
              },
              child: const Text(
                'Mulai',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
