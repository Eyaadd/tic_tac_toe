import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/xo_screen.dart';

void main (){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: XoScreen.routeName,
      routes: {
        XoScreen.routeName : (context) => XoScreen(),
        GameScreen.routeName : (context) => GameScreen(),
      }
      ,
      home: XoScreen(),
    );
  }
}
