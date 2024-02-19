//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '/providers/tasksProvider.dart';
//widgets
import '/widgets/taskBox.dart';

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context);
    return tasks.Achieved.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.asset(
                      './assets/images/crying.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Center(
                child: Text(
                  'You Have No Achievements Yet...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 30, left: 19, right: 19),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5 / 4,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return TaskBox(
                    task: tasks.Achieved[index],
                    image: tasks.AImage[index],
                    points: tasks.APoints[index],
                    index: index,
                    color: Colors.amber,
                  );
                },
                itemCount: tasks.Achieved.length),
          );
  }
}
