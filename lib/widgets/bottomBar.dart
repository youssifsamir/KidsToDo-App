//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '../providers/bottomBarProvider.dart';

class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomBarProvider>(context);
    int currentIndex = provider.getCurrentIndex;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      selectedIconTheme: const IconThemeData(size: 27),
      onTap: (index) => provider.updateBody(index),
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      Colors.amber,
                      Colors.orange,
                      Colors.deepOrange,
                    ],
                    begin: Alignment.topCenter,
                  ).createShader(rect),
                  child: const ImageIcon(
                    AssetImage('./assets/images/tasks.png'),
                    color: Colors.white,
                    size: 65,
                  ),
                )
              : ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      Colors.indigo,
                      Colors.blue,
                    ],
                    begin: Alignment.topCenter,
                  ).createShader(rect),
                  child: const ImageIcon(
                    AssetImage('./assets/images/tasks.png'),
                    color: Colors.white,
                    size: 65,
                  ),
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      Colors.amber,
                      Colors.orange,
                      Colors.deepOrange,
                    ],
                    begin: Alignment.topCenter,
                  ).createShader(rect),
                  child: const ImageIcon(
                    AssetImage('./assets/images/medal.png'),
                    color: Colors.white,
                    size: 70,
                  ),
                )
              : ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      Colors.indigo,
                      Colors.blue,
                    ],
                    begin: Alignment.topCenter,
                  ).createShader(rect),
                  child: const ImageIcon(
                    AssetImage('./assets/images/medal.png'),
                    color: Colors.white,
                    size: 70,
                  ),
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      Colors.amber,
                      Colors.orange,
                      Colors.deepOrange,
                    ],
                    begin: Alignment.topCenter,
                  ).createShader(rect),
                  child: const ImageIcon(
                    AssetImage('./assets/images/coins.png'),
                    color: Colors.white,
                    size: 70,
                  ),
                )
              : ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      Colors.indigo,
                      Colors.blue,
                    ],
                    begin: Alignment.topCenter,
                  ).createShader(rect),
                  child: const ImageIcon(
                    AssetImage('./assets/images/coins.png'),
                    color: Colors.white,
                    size: 70,
                  ),
                ),
          label: '',
        ),
      ],
    );
  }
}
