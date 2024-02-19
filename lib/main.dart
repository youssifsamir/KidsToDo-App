//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//providers
import 'providers/accounts.dart';
import '/providers/tasksProvider.dart';
import '/providers/rewardsProvider.dart';
import 'providers/bottomBarProvider.dart';

//screens
import 'screens/tabScreen.dart';
import '/screens/qrScanner.dart';
import 'screens/loginScreen.dart';
import '/screens/qrVouchers.dart';
import 'screens/avatarPicker.dart';
import 'screens/signupScreens/emailScreen.dart';
import 'screens/signupScreens/genderScreen.dart';
import 'screens/signupScreens/nameAgeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => BottomBarProvider()),
        ChangeNotifierProvider(create: (ctx) => AccountsProvider()),
        ChangeNotifierProvider(create: (ctx) => TaskProvider()),
        ChangeNotifierProvider(create: (ctx) => RewardsProvider()),
      ],
      child: MaterialApp(
        title: 'My Shop App',
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Colors.orange[400],
            contentTextStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'RaleWay',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          canvasColor: Colors.white,
          textTheme: const TextTheme(
            //PageView Title
            displayLarge: TextStyle(
              fontFamily: 'RaleWay',
              fontSize: 54,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            displayMedium: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            displaySmall: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black26,
              fontStyle: FontStyle.italic,
            ),
            labelLarge: TextStyle(
              fontSize: 16,
              fontFamily: 'RaleWay',
              color: Colors.black45,
            ),
            labelMedium: TextStyle(
              fontSize: 15,
              color: Colors.amber,
            ),
            labelSmall: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headlineLarge: TextStyle(
              fontSize: 30,
              // fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headlineMedium: TextStyle(
              fontFamily: 'RaleWay',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headlineSmall: TextStyle(
              // fontFamily: 'RaleWay',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontSize: 18,
              fontFamily: 'RaleWay',
              // fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              fontFamily: 'RaleWay',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'RaleWay',
              fontSize: 22,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: UserProfileScreen(),
        routes: {
          UserProfileScreen.routeName: (ctx) => UserProfileScreen(),
          TabScreen.routeName: (ctx) => TabScreen(),
          NameAgeScreen.routeName: (ctx) => NameAgeScreen(),
          GenderScreen.routeName: (ctx) => GenderScreen(),
          EmailScreen.routeName: (ctx) => EmailScreen(),
          AvatarPicker.routeName: (ctx) => AvatarPicker(),
          QRvouchers.routeName: (ctx) => QRvouchers(),
          QRscanner.routeName: (ctx) => QRscanner(),
        },
      ),
    );
  }
}
