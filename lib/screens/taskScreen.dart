//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import '/providers/tasksProvider.dart';
//widgets
import '/widgets/taskBox.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context);

    return tasks.Tasks.isEmpty
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
                      './assets/images/dance.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Center(
                child: Text(
                  "You've Achieved All Today's Tasks !",
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
                  task: tasks.Tasks[index],
                  image: tasks.Images[index],
                  points: tasks.Points[index],
                  index: index,
                  color: Colors.white,
                );
              },
              itemCount: tasks.Tasks.length,
            ),
          );
  }
}
