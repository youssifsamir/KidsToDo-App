//packages
import 'package:flutter/material.dart';

//providers
import '/providers/accounts.dart';
import 'package:provider/provider.dart';
import '/providers/bottomBarProvider.dart';

//screens
import '/screens/taskScreen.dart';
import '/screens/rewardsScreen.dart';
import '/screens/achievementsScreen.dart';

//widgets
import '/widgets/drawer.dart';
import '/widgets/bottomBar.dart';

class TabScreen extends StatelessWidget {
  static final routeName = './tabScreen.dart';
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)?.settings.arguments as String;
    final List<dynamic> body = [
      TaskScreen(),
      AchievementsScreen(),
      RewardsScreen(),
    ];
    final List<String> titles = [
      'DAILY TASKS',
      'ACHIEVEMENTS',
      'REWARDS',
    ];
    return Scaffold(
      drawer: MainDrawer(username: username),
      appBar: AppBar(
        title: Consumer<BottomBarProvider>(
          builder: (context, screen, _) => Text(
            titles[screen.getCurrentIndex],
            style: const TextStyle(color: Colors.black),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.indigo,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Consumer<AccountsProvider>(
                builder: (context, account, _) => CircleAvatar(
                  backgroundImage:
                      AssetImage(account.getByUsername(username).avatar),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      // extendBodyBehindAppBar: true,
      body: Consumer<BottomBarProvider>(
        builder: (context, screen, _) => body[screen.index],
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
