import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //for hide debug banner
        home: Scaffold(
          body: Container(
            child: LoginPage(),
          ),
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, //for spacing in these containers
      children: <Widget>[
        Container(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Text("Welcome"),
            ),
            Text("You can learn more")
          ],
        )),
        Container(
          child: Center(
            child: Text("image"), //Image
          ),
        ),
        Container(
          child: Center(
            child: Text("Button"), //Button
          ),
        )
      ],
    ));
  }
}
