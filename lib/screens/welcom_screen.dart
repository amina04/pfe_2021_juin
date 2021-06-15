import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:pfe_2021_juin/screens/list_medi_screen.dart';

class Welcome_screen extends StatelessWidget {
  static String id = 'Welcome_screen';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image(
                image: AssetImage('images/415.jpg'),
              ),
            ),
            flex: 3,
          ),


          Expanded(
            child: Text(
              'Hello doctor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height/42,

                color: Colors.blue.shade800,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: LoadingBouncingGrid.square(
                borderColor: Colors.cyan,
                borderSize: 2.0,

                size: 50.0,

                backgroundColor: Colors.tealAccent,
                duration: Duration(milliseconds: 500),

              ),

          ),
        ],
      ),
    );
  }
}
