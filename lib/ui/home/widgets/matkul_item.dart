import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_mhs/ui/detail/detail_page.dart';
import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';
import 'package:flutter_presensi_mhs/ui/scan/scan_page.dart';

class MatkulItem extends StatefulWidget {
  final PerkuliahanItem? perkuliahanItem;
  final Function()? presensiAction;

  const MatkulItem({Key? key, this.perkuliahanItem, this.presensiAction})
      : super(key: key);

  @override
  State<MatkulItem> createState() => _MatkulItemState();
}

class _MatkulItemState extends State<MatkulItem> {
  bool isDoingPresensi = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isCanPresensi(String? status) {
    return status == 'not_started' || status == 'ongoing';
  }

  Widget _buildPresensiButton(BuildContext context,
      {required String? statusPerkuliahan}) {
    return _isCanPresensi(statusPerkuliahan)
        ? !isDoingPresensi
            ? MaterialButton(
                minWidth: 0.0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: kPrimaryButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () async {
                  String code = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ScanPage()));
                  log('dosen_qrcode:$code');
                  if (!mounted) return;
                  String? accessToken =
                      BlocProvider.of<AuthBloc>(context).state.auth.accessToken;
                  if (accessToken != null) {
                    BlocProvider.of<HomeBloc>(context)
                        .doPresensi(accessToken, code);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Access token is null'),
                      ),
                    );
                  }
                },
                child: Row(
                  children: const [
                    Text(
                      'Presensi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Icon(
                      Icons.qr_code_scanner,
                      size: 16.0,
                    )
                  ],
                ),
              )
            : const CircularProgressIndicator()
        : Text(
            'Perkuliahan telah selesai',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const DetailPage()));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 24.0,
              child: Text(
                'PP',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                          text: '${widget.perkuliahanItem?.matkul}\n',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const TextSpan(
                          text: 'Pertemuan Ke-1\n',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.perkuliahanItem?.namaDosen}',
                          style: const TextStyle(
                            fontSize: 12.0,
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
                          color: Colors.black12,
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
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Selesai',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0,
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
                                    text:
                                        '${widget.perkuliahanItem?.beginTime}\n',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.perkuliahanItem?.endTime}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      _buildPresensiButton(context,
                          statusPerkuliahan:
                              widget.perkuliahanItem?.statusPerkuliahan)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
