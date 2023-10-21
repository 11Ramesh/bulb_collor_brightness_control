import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:led_control_2/home.dart';
import 'package:led_control_2/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class splash_sceen extends StatelessWidget {
  const splash_sceen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              child: Image.asset(
                'assets/icon/icon_home.png',
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 180,
                ),
                Text(
                  "Loading ...",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
      nextScreen: home1(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const splash_sceen(),
    );
  }
}
