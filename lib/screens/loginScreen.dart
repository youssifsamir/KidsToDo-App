//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '../providers/accounts.dart';

//screens
import '../screens/tabScreen.dart';
import '../screens/signupScreens/genderScreen.dart';

class UserProfileScreen extends StatefulWidget {
  static final routeName = './userprofileScreen.dart';

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String username = '', password = '';
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 450,
                child: Image.asset(
                  './assets/images/welcome2.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Username: ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 200,
                    height: 35,
                    color: const Color.fromARGB(17, 0, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 2),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => setState(
                          () {
                            username = value;
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Password: ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 200,
                    height: 35,
                    color: const Color.fromARGB(17, 0, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 2),
                      child: Stack(
                        children: <Widget>[
                          TextField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            obscureText: show ? false : true,
                            onChanged: (value) => setState(
                              () {
                                password = value;
                              },
                            ),
                          ),
                          Positioned(
                            right: 5,
                            bottom: -8,
                            child: IconButton(
                              onPressed: () => setState(
                                () {
                                  show = !show;
                                },
                              ),
                              icon: Icon(show
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 207, 6, 79),
                    Color.fromARGB(255, 207, 6, 79),
                  ],
                  begin: Alignment.topCenter,
                ).createShader(rect),
                child: Consumer<AccountsProvider>(
                  builder: (ctx, provider, _) => GestureDetector(
                    onTap: () {
                      if (provider.login(username, password)) {
                        Navigator.of(context).popAndPushNamed(
                          TabScreen.routeName,
                          arguments: username,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {},
                            ),
                            content: Text('  Welcome Back $username !'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.pink[900],
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {},
                            ),
                            content: Text(
                              '                    Wrong Username / Password',
                              style: Theme.of(context).textTheme.headlineSmall,
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
                          'LOGIN',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: (() => Navigator.of(context).pushNamed(
                        GenderScreen.routeName,
                      )),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
