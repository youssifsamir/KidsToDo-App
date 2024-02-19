//packages
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  final List<String> _Tasks = [
    'Exercise',
    'Eat an orange',
    'Sleep early',
    'Brush your teeth',
    'Finish your homework',
    'Pet a cat',
    'Eat a banana',
    'Help a friend',
  ];
  final List<String> _Images = [
    './assets/images/monster7.gif',
    './assets/images/orange.gif',
    './assets/images/early.gif',
    './assets/images/brushteeth.gif',
    './assets/images/book.gif',
    './assets/images/pet.gif',
    './assets/images/banana.gif',
    './assets/images/friend.gif',
  ];
  final List<int> _Points = [5, 2, 10, 7, 15, 1, 4, 16];

  final List<String> Achieved = [];
  final List<String> AImage = [];
  final List<int> APoints = [];

  List<String> get Tasks {
    return [..._Tasks];
  }

  List<String> get Images {
    return [..._Images];
  }

  List<int> get Points {
    return [..._Points];
  }

  void toggleLists(Color color, int index) {
    if (color == Colors.amber) {
      _Tasks.add(Achieved[index]);
      _Images.add(AImage[index]);
      _Points.add(APoints[index]);

      Achieved.remove(Achieved[index]);
      AImage.remove(AImage[index]);
      APoints.remove(APoints[index]);
    } else {
      Achieved.add(Tasks[index]);
      AImage.add(Images[index]);
      APoints.add(Points[index]);

      _Tasks.remove(_Tasks[index]);
      _Images.remove(_Images[index]);
      _Points.remove(_Points[index]);
    }
    notifyListeners();
  }
}
