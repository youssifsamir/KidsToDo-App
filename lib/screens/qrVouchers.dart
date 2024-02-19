//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/rewardsProvider.dart';

//screens
import '/screens/qrScanner.dart';

class QRvouchers extends StatelessWidget {
  static const routeName = './qrVouchers.dart';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RewardsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              QRscanner.routeName,
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: SizedBox(
                  height: 300,
                  child: Image.asset(
                    './assets/images/scanme.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "TAP TO SCAN",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 35),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.indigo,
            child: const Center(
              child: Text(
                'Scanned Vouchers',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          provider.scanned.isEmpty
              ? Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Center(
                        child: Image.asset('./assets/images/noscanned.png'),
                      ),
                    ),
                    const SizedBox(
                      child: Center(
                        child: Text('No Scanned Vouchers'),
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: Text(provider.scanned[index]),
                      );
                    },
                    itemCount: provider.scanned.length,
                  ),
                ),
        ],
      ),
    );
  }
}
