import 'package:flutter/material.dart';
import 'package:login_dice_app/dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      // 키입력 받을때 화면 빈공간 터치하면 키보드 사라지도록 하려고 넣음
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Center(
                child: Image(
                  image: AssetImage('image/chun.png'),
                  width: 170.0,
                  height: 190.0,
                ),
              ),
              Form(
                  child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle:
                                  TextStyle(color: Colors.teal, fontSize: 15.0))),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Enter Dice",
                              ),
                              controller: controller,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Enter Password",
                              ),
                              controller: controller2,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                  fixedSize: Size(100, 50)),
                              onPressed: () {
                                if (controller.text == "jidon333" &&
                                    controller2.text == "abc123") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {return Dice();},
                                      ));
                                } else {
                                  showSnaceBar(context);
                                }
                              },
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

void showSnaceBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Input error pw or id"),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.redAccent,
  ));
}
