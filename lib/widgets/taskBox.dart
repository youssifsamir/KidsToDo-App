//packages
import 'package:flutter/material.dart';

//widgets
import 'toggler.dart';

class TaskBox extends StatelessWidget {
  final String task, image;
  final int points, index;
  final Color color;

  TaskBox({
    required this.task,
    required this.image,
    required this.points,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 20),
              color: Colors.indigo,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Center(
                      child: Text(
                        task,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Toggler(index: index, color: color),
                ],
              ),
            ),
            SizedBox(
              height: 35,
              child: Center(
                child: Text(
                  '+ $points points',
                  style: const TextStyle(
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'RaleWay',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: SizedBox(
                height: 140,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
