import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  String player = "";
  int index;
  Function onBtnClicked;

  ButtonItem({required this.player, required this.onBtnClicked, required this.index ,super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            onBtnClicked(index);
          },
          child: player.isEmpty
              ? SizedBox()
              : Image(image: AssetImage("assets/images/$player.png")),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
        ),
      ),
    );
  }
}
