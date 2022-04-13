import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/ui/jadwal/widgets/matkul_item.dart';

class JadwalItem extends StatelessWidget {
  const JadwalItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Senin',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.black87, fontSize: 16.0),
        ),
        const Divider(),
        Column(
          children: const [
            MatkulItem(),
            MatkulItem(),
            MatkulItem(),
            MatkulItem(),
            MatkulItem(),
          ],
        ),
        const SizedBox(height: 16.0)
      ],
    );
  }
}
