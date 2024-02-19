//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '../providers/accounts.dart';
import '../providers/tasksProvider.dart';

class Toggler extends StatelessWidget {
  final int index;
  final Color color;
  Toggler({required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountsProvider>(context);
    final task = Provider.of<TaskProvider>(context);

    return IconButton(
      padding: const EdgeInsets.only(right: 15),
      splashColor: Colors.transparent,
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
            content: color == Colors.amber
                ? Text('${task.APoints[index]} pts are removed !')
                : Text('${task.Points[index]} pts are added !'),
            duration: const Duration(seconds: 2),
          ),
        );
        color == Colors.amber
            ? account.alterPoints(-task.APoints[index])
            : account.alterPoints(task.Points[index]);

        task.toggleLists(color, index);

        print(account.getPoints());
      },
      color: color,
      icon: const Icon(Icons.thumb_up_sharp),
    );
  }
}
