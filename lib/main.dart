import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee Roll')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int ltnumber = 1;
  int rtnumber = 1;
  int max = 6;
  int min = 1;
  @override
  Widget build(BuildContext context) {
    int sum = ltnumber + rtnumber;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  var rn = new Random();
                  setState(() {
                    ltnumber = min + rn.nextInt(max + 1 - min);
                  });
                },
                child: Image.asset('images/dice$ltnumber.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  var rn = new Random();
                  setState(() {
                    rtnumber = min + rn.nextInt(max + 1 - min);
                  });
                },
                child: Image.asset('images/dice$rtnumber.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            title: Center(
              child: Text(
                '$sum Points',
                style: TextStyle(
                  color: Colors.teal[900],
                  fontSize: 20.0,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        ButtonTheme(
          buttonColor: Colors.red[200],
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton(
            onPressed: () {
              var rn = new Random();
              setState(() {
                ltnumber = min + rn.nextInt(max + 1 - min);
                rtnumber = min + rn.nextInt(max + 1 - min);
              });
            },
            child: Text("Roll Dice"),
          ),
        ),
      ],
    );
  }
}
