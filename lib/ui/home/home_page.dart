import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/absen_item.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/absen_item_child.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/home_drawer.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/matkul_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perkuliahan Hari Ini',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'Senin, 27 Okt 2022',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Divider(),
                Column(
                  children: const [
                    MatkulItem(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
