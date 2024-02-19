//packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//screens
import '../signupScreens/emailScreen.dart';
import '/screens/avatarPicker.dart';

class NameAgeScreen extends StatefulWidget {
  static final routeName = './nameAgeScreen.dart';

  @override
  State<NameAgeScreen> createState() => _NameAgeScreen();
}

class _NameAgeScreen extends State<NameAgeScreen> {
  bool show = true;
  late String username, password, age;
  final List<String> ageRange = [
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18'
  ];
  @override
  void initState() {
    username = password = '';
    age = '8';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gender = ModalRoute.of(context)?.settings.arguments as String;
    final accounts = Provider.of<AccountsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "You're Almost Done...",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 30),
            Center(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Container(
                      height: 400,
                      width: 300,
                      color: const Color.fromARGB(8, 0, 0, 0),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 60,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AvatarPicker.routeName,
                              );
                            },
                            child: SizedBox(
                              height: 180,
                              width: 180,
                              child: Image.asset(
                                accounts.currentAvatar == ''
                                    ? gender == 'M'
                                        ? './assets/images/monster2.gif'
                                        : './assets/images/monster6.gif'
                                    : accounts.currentAvatar,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 35),
                          height: 35,
                          width: 150,
                          color: Colors.white,
                          child: TextField(
                            onChanged: (value) => setState(
                              () {
                                username = value;
                              },
                            ),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 11),
                              border: OutlineInputBorder(),
                              hintText: 'Choose a username',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 35,
                          width: 150,
                          color: Colors.white,
                          child: TextField(
                            onChanged: (value) => setState(
                              () {
                                password = value;
                              },
                            ),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 11),
                              border: OutlineInputBorder(),
                              hintText: 'Choose a password',
                            ),
                            obscureText: show,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 35,
                    right: 50,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        AvatarPicker.routeName,
                      ),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset('./assets/images/swap.png'),
                        // child: Icon(
                        //   Icons.change_circle,
                        //   color: Colors.amber,
                        //   size: 40,
                        // ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 72,
                    bottom: 40,
                    child: IconButton(
                      onPressed: () => setState(
                        () {
                          show = !show;
                        },
                      ),
                      icon: Icon(
                        show
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "What's Your Age?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: SizedBox(
                width: 280,
                height: 90,
                child: CarouselSlider(
                  items: ageRange.map((e) {
                    return Text(
                      e,
                      style: TextStyle(
                        fontSize: age == e ? 80 : 50,
                        color: age == e ? Colors.amber : Colors.indigo,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    initialPage: 4,
                    viewportFraction: 0.35,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        age = ageRange[index];
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                colors: [Colors.indigo, Colors.blue],
                begin: Alignment.topCenter,
              ).createShader(rect),
              child: GestureDetector(
                onTap: () {
                  if (accounts.namepassValidation(username, password) == 2) {
                    if (accounts.currentAvatar == '') {
                      gender == 'M'
                          ? accounts.currentAvatar =
                              './assets/images/monster2.gif'
                          : accounts.currentAvatar =
                              './assets/images/monster6.gif';
                    }
                    Navigator.of(context).pushNamed(
                      EmailScreen.routeName,
                      arguments: {
                        'username': username,
                        'password': password,
                        'age': age,
                        'gender': gender,
                      },
                    );
                  } else if (accounts.namepassValidation(username, password) ==
                      0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                        content: const Text(' Enter  username/password'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                        content: const Text(
                          '  Unlucky username already taken',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
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
      ),
    );
  }
}
