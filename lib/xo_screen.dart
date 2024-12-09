import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_screen.dart';

class XoScreen extends StatelessWidget {
  static const String routeName = "Home";
  const XoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF00D2FF),
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: Text(
              "Pick who goes first?",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            )),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, GameScreen.routeName , arguments: 0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Image.asset("assets/images/x.png"),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, GameScreen.routeName , arguments: 1);
                  },
                  child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Image.asset("assets/images/o.png")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
