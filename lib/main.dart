import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/detail/detail_page.dart';
import 'package:flutter_presensi_mhs/ui/home/home_page.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Presensi Mahasiswa',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const SplashPage(),
    );
  }
}
