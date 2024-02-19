//packages
import 'package:flutter/material.dart';

//screens
import '/screens/signupScreens/nameAgeScreen.dart';

class GenderScreen extends StatefulWidget {
  static final routeName = './genderScreen.dart';

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  late bool male, female;
  String gender = '';

  @override
  void initState() {
    male = false;
    female = false;
    super.initState();
  }

  void setGender(int set) {
    if (set == 1) {
      male = true;
      female = false;
      gender = 'M';
    } else {
      male = false;
      female = true;
      gender = 'F';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            "What's your gender?",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 30),
          Center(
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Container(
                    height: 500,
                    width: 300,
                    color: const Color.fromARGB(8, 0, 0, 0),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 75,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              setGender(1);
                            });
                          },
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              './assets/images/monster2.gif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Male',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 280,
                  right: 75,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              setGender(0);
                            });
                          },
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              './assets/images/monster6.gif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Female',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 78,
                  child: SizedBox(
                    height: male == true ? 40 : 0,
                    child: Image.asset('./assets/images/tick.png'),
                  ),
                ),
                Positioned(
                  top: 290,
                  right: 78,
                  child: SizedBox(
                    height: female == true ? 40 : 0,
                    child: Image.asset('./assets/images/tick.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              colors: [
                Colors.indigo,
                Colors.blue,
              ],
              begin: Alignment.topCenter,
            ).createShader(rect),
            child: GestureDetector(
              onTap: () {
                gender != ''
                    ? Navigator.of(context).pushNamed(
                        NameAgeScreen.routeName,
                        arguments: gender,
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {},
                          ),
                          content: const Text(
                              '                     Choose A Gender'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  color: Colors.white70,
                ),
                child: Center(
                  child: Text(
                    'NEXT',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
