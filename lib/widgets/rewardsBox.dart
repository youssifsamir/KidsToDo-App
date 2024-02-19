//packages
import 'package:flutter/material.dart';

class RewardsBox extends StatelessWidget {
  final String name, voucher, points, image;
  RewardsBox({
    required this.name,
    required this.voucher,
    required this.points,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(8, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 100,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      name,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '$voucher \$',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.amberAccent,
                        Colors.amber,
                        Colors.orange,
                        Colors.deepOrange,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      'CLAIM',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(113, 83, 109, 254),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Text(
              '$points pts',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    );

    // return Stack(
    //   children: <Widget>[
    //     Container(
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(60),
    //         gradient: lineargradient,
    //       ),
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 30),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(height: 25),
    //             Text(
    //               name,
    //               style: const TextStyle(
    //                 color: Colors.white,
    //                 fontFamily: 'RaleWay',
    //                 fontSize: 30,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       top: 50,
    //       right: 50,
    //       child: Text(
    //         '$voucher \$',
    //         style: const TextStyle(
    //           color: Colors.white,
    //           // fontWeight: FontWeight.bold,
    //           fontSize: 50,
    //         ),
    //       ),
    //     ),
    //     //
    //     Positioned(
    //       top: 70,
    //       left: 50,
    //       child: CircleAvatar(
    //         radius: 37,
    //         backgroundImage: AssetImage(image),
    //       ),
    //     )
    //   ],
    // );
  }
}
