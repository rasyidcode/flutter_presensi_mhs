import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';

enum AbsenItemChildState { ABSEN_TIME, NOT_YET, ALPHA, DONE }

class AbsenItemChild extends StatelessWidget {
  const AbsenItemChild({
    Key? key,
    required this.matkulName,
    required this.meetingCount,
    required this.teacherName,
    required this.startTime,
    required this.endTime,
    required this.state,
  }) : super(key: key);
  final String matkulName;
  final int meetingCount;
  final String teacherName;
  final String startTime;
  final String endTime;
  final AbsenItemChildState state;

  Widget _buildAbsenStateWidget(AbsenItemChildState state) {
    switch (state) {
      case AbsenItemChildState.ABSEN_TIME:
        return MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          color: kLogoutButtonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          onPressed: () {
            if (kDebugMode) {
              print('Presensi');
            }
          },
          child: const Text(
            'Presensi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        );
      case AbsenItemChildState.NOT_YET:
        return const Text(
          'Belum waktu absen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 12.0,
          ),
        );
      case AbsenItemChildState.ALPHA:
        return Text(
          'Tidak Hadir',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red.withOpacity(0.75),
            fontSize: 12.0,
          ),
        );
      case AbsenItemChildState.DONE:
        return Text(
          'Sudah selesai',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green.withOpacity(0.75),
            fontSize: 12.0,
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 24.0,
            child: Text('PP'),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$matkulName\n',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      TextSpan(
                        text: 'Pertemuan Ke-$meetingCount\n',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: teacherName,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Mulai\n',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Selesai',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '$startTime\n',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: endTime,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildAbsenStateWidget(state)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
