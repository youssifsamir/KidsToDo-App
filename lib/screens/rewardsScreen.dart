//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/rewardsProvider.dart';
import '/providers/accounts.dart';

//widgets
import '/widgets/rewardsBox.dart';

class RewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RewardsProvider>(context);
    return Stack(
      children: <Widget>[
        Container(
          height: 75,
          color: Colors.indigo,
          child: Center(
            child: Consumer<AccountsProvider>(
              builder: (context, account, _) => Text(
                '${account.getPoints()} pts',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RewardsBox(
                    name: provider.rewards[index].name,
                    voucher: provider.rewards[index].voucher.toString(),
                    points: provider.rewards[index].points.toString(),
                    image: provider.images[provider.images.indexWhere(
                      (element) => element == provider.images[index],
                    )],
                  ),
                );
              },
              itemCount: provider.rewards.length),
        ),
      ],
    );
  }
}
