//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

//providers
import '/providers/rewardsProvider.dart';

class QRscanner extends StatelessWidget {
  static const routeName = './qrScanner.dart';
  MobileScannerController cameraController = MobileScannerController();

  bool _screenOpened = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RewardsProvider>(context);
    Future<void> _foundQR(Barcode qrCode, MobileScannerArguments? args) async {
      if (!_screenOpened) {
        final String code = qrCode.rawValue ?? "---";
        debugPrint('QRcode Found! $code');
        _screenOpened = true;
        provider.addScanned(code);

        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.indigo),
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: _foundQR,
      ),
    );
  }
}
