import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color(0x0fffffff),
    100: Color(0x1fffffff),
    200: Color(0x2fffffff),
    300: Color(0x3fffffff),
    400: Color(0x4fffffff),
    500: Color(0x5fffffff),
    600: Color(0x6fffffff),
    700: Color(0x7fffffff),
    800: Color(0x8fffffff),
    900: Color(0x9fffffff),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '소주최대몇?',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF073111, color),
      ),
      home: mainPage(title: '소주최대몇??'),
    );
  }
}

class mainPage extends StatefulWidget {
  mainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _readData();
    });
  }

  void _drink() {
    setState(() {
      _counter++;
    });
    _saveData();
  }

  void _minusOne() {
    setState(() {
      _counter--;
    });
    _saveData();
  }

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'counter';
    final value = _counter;
    prefs.setInt(key, value);
  }

  _readData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'counter';
    final value = prefs.getInt(key);
    _counter = value ?? 0;
    // print("read: ${_alarmCycle}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/soju.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: new SizedBox(
                        child: FloatingActionButton(
                      child: Text(
                        "-1",
                        style: TextStyle(
                            color: Color(0xFF073111),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: _minusOne,
                    ))),
                SizedBox(
                  width: 30,
                ),
                Text(
                  _counter >= 8
                      ? '${_counter ~/ 8}병 ${_counter % 8}잔'
                      : '$_counter잔',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                    alignment: Alignment.center,
                    child: new SizedBox(
                        child: FloatingActionButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                            color: Color(0xFF073111),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: _drink,
                    ))),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Game()));
                },
                child: Text(
                  "취했나 테스트",
                  style: TextStyle(fontSize: 28),
                ))
          ],
        ),
      ),
    );
  }
}
