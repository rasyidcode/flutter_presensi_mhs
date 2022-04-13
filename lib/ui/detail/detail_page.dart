import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Detail Perkuliahan',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 50.0,
              child: Text(
                'PP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Pengelanan Pemrograman',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pertemuan Ke\n',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Nama Dosen\n',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Jumlah SKS\n',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Jam Mulai\n',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Jam Selesai\n',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Durasi',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.right,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '1\n',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Ahmad Jamil Al Rasyid S.Kom\n',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: '24\n',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: '12:00\n',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: '14:00\n',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: '120 Menit',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
