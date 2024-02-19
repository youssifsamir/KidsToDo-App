//packages
import 'package:flutter/material.dart';

class Rewards {
  final String name;
  final int voucher, points;
  Rewards({required this.name, required this.voucher, required this.points});
}

class RewardsProvider with ChangeNotifier {
  final List<Rewards> _rewards = [
    Rewards(name: 'Toy Shop', voucher: 50, points: 200),
    Rewards(name: 'New Born', voucher: 45, points: 250),
    Rewards(name: 'Kidzenia', voucher: 100, points: 1500),
    Rewards(name: 'ColdStone', voucher: 20, points: 100),
    Rewards(name: 'Pet Shop', voucher: 75, points: 350),
  ];
  final List<String> _images = [
    './assets/images/toyshop.jpeg',
    './assets/images/toybox.jpeg',
    './assets/images/kidzania.png',
    './assets/images/coldstone.png',
    './assets/images/petshop.jpeg',
  ];

  List<String> _scanned = [];

  List<Rewards> get rewards {
    return [..._rewards];
  }

  List<String> get images {
    return [..._images];
  }

  List<String> get scanned {
    return [..._scanned];
  }

  void addScanned(String value) {
    _scanned.add(value);
    notifyListeners();
  }
}
