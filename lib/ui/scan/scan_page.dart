import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Barcode? scanRes;
  QRViewController? qrViewController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Scan QR',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: _qrKey,
              onQRViewCreated: (QRViewController ctrl) {
                setState(() {
                  qrViewController = ctrl;
                });
                ctrl.scannedDataStream.listen((event) {
                  if (kDebugMode) {
                    print(event.code);
                  }
                  scanRes = event;
                });
              },
              overlay: QrScannerOverlayShape(
                  borderColor: kPrimaryColor,
                  borderRadius: 12,
                  borderLength: 12,
                  borderWidth: 5,
                  cutOutSize: scanArea),
              onPermissionSet: (QRViewController ctrl, bool p) {
                log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
                if (!p) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('no Permission')));
                }
              },
            ),
          ),
          Text(
            'Arahkan ke QRCode milik dosen, selain itu scan akan gagal!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}
