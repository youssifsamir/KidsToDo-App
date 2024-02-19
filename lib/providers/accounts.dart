//packages
import 'package:flutter/material.dart';

class Account {
  final String username, password, gender, age, email, avatar;
  Account({
    required this.username,
    required this.password,
    required this.gender,
    required this.age,
    required this.email,
    required this.avatar,
  });
}

class AccountsProvider with ChangeNotifier {
  String currentAvatar = '';
  int _points = 0;

  final List<Account> _AccountsList = [
    Account(
      username: 'Mariam',
      password: '123',
      gender: 'F',
      age: '18',
      email: 'memo@gmail.com',
      avatar: './assets/images/monster5.gif',
    ),
    Account(
      username: 'Joe',
      password: '456',
      gender: 'M',
      age: '18',
      email: 'joe@gmail.com',
      avatar: './assets/images/monster2.gif',
    ),
    Account(
      username: 'Manar',
      password: '789',
      gender: 'F,',
      email: 'maro@gmail.com',
      age: '8',
      avatar: './assets/images/monster7.gif',
    ),
  ];

  final List<String> _AvatarList = [
    './assets/images/monster1.gif',
    './assets/images/monster2.gif',
    './assets/images/monster3.gif',
    './assets/images/monster4.gif',
    './assets/images/monster5.gif',
    './assets/images/monster6.gif',
    './assets/images/monster7.gif',
  ];

  List<String> get AvatarList {
    return [..._AvatarList];
  }

  List<Account> get AccountsList {
    return [..._AccountsList];
  }

  Account getByUsername(String username) {
    return _AccountsList.firstWhere((element) => element.username == username);
  }

  bool login(String username, String password) {
    int index =
        _AccountsList.indexWhere((element) => element.username == username);
    if (index != -1) {
      if (password == AccountsList[index].password) return true;
    }
    return false;
  }

  int namepassValidation(String username, String password) {
    int index =
        _AccountsList.indexWhere((element) => element.username == username);
    if (username == '' || password == '') {
      return 0;
    } else if (index != -1) {
      return 1;
    }

    return 2;
  }

  void alterPoints(int x) {
    _points += x;
  }

  int getPoints() {
    return _points;
  }

  int emailValidation(String email) {
    if (email == '') {
      return 0;
    } else if (email.contains('@')) {
      return 1;
    }
    return 2;
  }

  void setAvatar(int index) {
    currentAvatar = AvatarList[index];
    notifyListeners();
  }

  void addAccount(String username, String password, String gender, String age,
      String email, avatar) {
    _AccountsList.add(
      Account(
        username: username,
        password: password,
        gender: gender,
        age: age,
        email: email,
        avatar: avatar,
      ),
    );
  }
}
