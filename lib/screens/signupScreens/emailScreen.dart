//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//screens
import '/screens/tabScreen.dart';

class EmailScreen extends StatefulWidget {
  static final routeName = './emailScreen.dart';

  @override
  State<EmailScreen> createState() => _EmailScreen();
}

class _EmailScreen extends State<EmailScreen> {
  late String email;

  @override
  void initState() {
    email = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<AccountsProvider>(context, listen: false);

    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final username = routeArgs['username'];
    final password = routeArgs['password'];
    final age = routeArgs['age'];
    final gender = routeArgs['gender'];

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
              "Just One More Step !",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 30),
            Center(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Container(
                      height: 350,
                      width: 300,
                      color: const Color.fromARGB(8, 0, 0, 0),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    child: Container(
                      margin: const EdgeInsets.only(top: 110),
                      height: 42,
                      width: 200,
                      color: Colors.white,
                      child: TextField(
                        onChanged: (value) => setState(() {
                          email = value;
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '        Enter an email',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 45,
                    child: Container(
                      margin: const EdgeInsets.only(top: 140),
                      height: 100,
                      width: 200,
                      child: Text(
                        "Hint:   If you don't have an email, let mommy or daddy enter their email.",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              width: 200,
              child: Image.asset(
                './assets/images/walkingmonster.gif',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                colors: [Colors.indigo, Colors.blue],
                begin: Alignment.topCenter,
              ).createShader(rect),
              child: GestureDetector(
                onTap: () {
                  if (accounts.emailValidation(email) == 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                        content: const Text(' Sorry wrong email'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else if (accounts.emailValidation(email) == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                        content: const Text(' Enter an email'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    accounts.addAccount(username!, password!, gender!, age!,
                        email, accounts.currentAvatar);
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 3);

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
                        content: Text(' Welcome $username !'),
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
                      'SIGN UP',
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
