import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pfe_2021_juin/screens/list_medi_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Welcome_screen extends StatelessWidget {
  static String id = 'Welcome_screen';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SplashScreenView(

        navigateRoute: list_med_screen(),
        duration: 9000,
        imageSize: 250,
        imageSrc: "images/BG.png",
        text: "Hello doctor",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 40.0,
          fontFamily: 'ConcertOne',
        ),
        colors: [
          Colors.teal,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}
