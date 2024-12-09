import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/card_item.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = "gameBoard";

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String title = "Player's 1 Turn";
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 60) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  late int playerName;

  @override
  Widget build(BuildContext context) {
    playerName = ModalRoute.of(context)?.settings.arguments as int;
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgcolor.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(44),
              ),
              child: Text(
                _start.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Colors.white),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonItem(
                    player: board[0],
                    index: 0,
                    onBtnClicked: onBtnClicked,
                  ),
                  ButtonItem(
                    player: board[1],
                    index: 1,
                    onBtnClicked: onBtnClicked,
                  ),
                  ButtonItem(
                    player: board[2],
                    index: 2,
                    onBtnClicked: onBtnClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonItem(
                    player: board[3],
                    index: 3,
                    onBtnClicked: onBtnClicked,
                  ),
                  ButtonItem(
                    player: board[4],
                    index: 4,
                    onBtnClicked: onBtnClicked,
                  ),
                  ButtonItem(
                    player: board[5],
                    index: 5,
                    onBtnClicked: onBtnClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonItem(
                    player: board[6],
                    index: 6,
                    onBtnClicked: onBtnClicked,
                  ),
                  ButtonItem(
                    player: board[7],
                    index: 7,
                    onBtnClicked: onBtnClicked,
                  ),
                  ButtonItem(
                    player: board[8],
                    index: 8,
                    onBtnClicked: onBtnClicked,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  int counter = 0;

  onBtnClicked(index) {
    if (board[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      board[index] = playerName == 0 ? "x" : "o";
      bool winner = checkWinner("x");
      if (winner) {
        title = "Player 1's win";
        resetBoard();
      }
    } else {
      board[index] = playerName == 1 ? "x" : "o";
      bool winner = checkWinner("o");
      if (winner) {
        title = "Player 2's win";
        resetBoard();
      }
    }
    counter++;
    setState(() {});
  }

  resetBoard() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }
}
