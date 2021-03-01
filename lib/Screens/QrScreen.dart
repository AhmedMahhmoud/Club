import 'package:demo_club/Screens/RestaurantAfterQr.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  var qrText = '';
  var ifScanned = false;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget _buildQrView(BuildContext context) {
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          Future.microtask(() => controller?.updateDimensions(qrKey));
          return false;
        },
        child: SizeChangedLayoutNotifier(
            key: const Key('qr-size-notifier'),
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            )));
  }

  @override
  void initState() {
    qrText = "";
    super.initState();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    bool scanned = false;
    controller.scannedDataStream.listen((scanData) async {
      qrText = scanData;
      if (!scanned) {
        scanned = true;
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(
              builder: (context) => RestaurantQR(),
            ))
            .then((value) => controller.resumeCamera());
      }
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(qrText);
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: _buildQrView(context)),
          ],
        ),
      ),
    );
  }
}
