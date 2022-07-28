import 'package:flutter/material.dart';

import 'package:flutter_presensi_mhs/constants.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/ui/detail/detail_page.dart';
import 'package:flutter_presensi_mhs/ui/scan/scan_page.dart';

class MatkulItem extends StatefulWidget {
  final PerkuliahanItem? perkuliahanItem;

  const MatkulItem({Key? key, required this.perkuliahanItem}) : super(key: key);

  @override
  State<MatkulItem> createState() => _MatkulItemState();
}

class _MatkulItemState extends State<MatkulItem> {
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
                      MaterialButton(
                        minWidth: 0.0,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        color: kPrimaryButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ScanPage()));
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
