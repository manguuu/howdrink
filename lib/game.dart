import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<int> arr = [1, 2, 3, 4, 5, 6];
  List<Color> color = [
    Color(0xFF073111),
    Color(0xFF073111),
    Color(0xFF073111),
    Color(0xFF073111),
    Color(0xFF073111),
    Color(0xFF073111),
    Color(0xFF073111),
  ];

  int cur = 1;

  @override
  void initState() {
    super.initState();
    playGame();
  }

  void playGame() {
    arr.shuffle();
    cur = 0;
  }

  void changeColor(int idx) {
    setState(() {
      color[idx] = Colors.white;
    });
    if (arr[idx] != cur + 1) {
      showWrong(context);
    } else if (cur == 5) {
      showRigrt(context);
    }
    cur++;
    print(color[idx]);
  }

  showWrong(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              content: Container(
            child: Column(
              children: [
                Text(
                  "당신은 취했습니다!!!!!!!!!!!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "인정",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ));
        });
  }

  showRigrt(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              content: Container(
            child: Column(
              children: [
                Text(
                  "아직 안취했군요?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "당근",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("취했니 안취했니"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Column(
            children: [
              Text("오름차순으로 누르세요!",
                  style: TextStyle(
                    color: Color(0xFF073111),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () => changeColor(0),
                      child: Text(
                        "${arr[0]}",
                        style: TextStyle(color: color[0], fontSize: 30),
                      )),
                  OutlinedButton(
                      onPressed: () => changeColor(1),
                      child: Text("${arr[1]}",
                          style: TextStyle(color: color[1], fontSize: 30))),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () => changeColor(2),
                      child: Text("${arr[2]}",
                          style: TextStyle(color: color[2], fontSize: 30))),
                  OutlinedButton(
                      onPressed: () => changeColor(3),
                      child: Text("${arr[3]}",
                          style: TextStyle(color: color[3], fontSize: 30))),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () => changeColor(4),
                      child: Text("${arr[4]}",
                          style: TextStyle(color: color[4], fontSize: 30))),
                  OutlinedButton(
                      onPressed: () => changeColor(5),
                      child: Text("${arr[5]}",
                          style: TextStyle(color: color[5], fontSize: 30))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
