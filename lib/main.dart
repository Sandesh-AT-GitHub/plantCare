import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import './homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xFF29AB87), //jungle grren, appbar
      scaffoldBackgroundColor: const Color(0xFFBFEEB7), //light green
      buttonColor: const Color(0xFF29AB87), //jungle green
      accentColor: const Color(0xFFF9F9F8), //white, text
    ),
    home: launchScreen(),
  ));
}

class launchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: const Color(0xFF29AB87),
      image: Image.asset(
        'assets/logo/logo.png',
      ),
      photoSize: 60,
      loaderColor: Colors.white,
      title: Text(
        'Plant Care',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'KirangHaerang',
        ),
        textScaleFactor: 4,
      ),
      seconds: 3,
      navigateAfterSeconds: homeScreen(),
    );
  }
}
