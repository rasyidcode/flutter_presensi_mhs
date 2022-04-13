import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';

class MatkulItem extends StatelessWidget {
  const MatkulItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24.0,
              child: Text('PP'),
              backgroundColor: kPrimaryColor,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Pengenalan Pemrograman',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Jamil Al Rasyid, S.Kom',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 8.0)
      ],
    );
  }
}
