import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/jadwal/widgets/jadwal_item.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Jadwal Mata Kuliah',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            JadwalItem(),
            JadwalItem(),
          ],
        ));
  }
}
