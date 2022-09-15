import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => DiceState();
}

class DiceState extends State<Dice> {
  @override
  int dice1_num = 1;
  int dice2_num = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
          title: Text("Hello dice page"), backgroundColor: Colors.redAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 공간내에서 꽉차게..
                  Expanded(
                    child: Image(image: AssetImage('image/dice$dice1_num.png'),),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: Image.asset('image/dice$dice2_num.png',))
                ],
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      dice1_num = Random().nextInt(6) + 1;
                      dice2_num = Random().nextInt(6) + 1;
                      showToast(dice1_num, dice2_num);
                    },);

                  },
                  child: Icon(
                    Icons.play_arrow,
                    size: 35,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber))),
            ),
          ],
        ),
      ),
    );
  }
}

void showToast(int a, int b){
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: "Left Dice: $a, Right Dice: $b",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  );
}
