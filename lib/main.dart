import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Lato"
            //for whole app font is Lato for single container
            // just use style : TextStyle(
            //fontFamily : "here"
            //)
            ),
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
  int _PageState = 0; // 0 for page 1 , 1 for page2 .....

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
              child: Text(
                "Meet Free",
                style: TextStyle(
                    color: Color(0xFFB583d72),
                    fontSize: 29,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Join app for free and attain & host your meeting for free",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFB583d72), fontSize: 18),
                ))
          ],
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Image.asset("assets/images/one.jpg"), //Image
          ),
        ),
        Container(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _PageState = 1;
                  });
                },
                child: Container(
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.all(35),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFB583d72),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )), //Button
                  ),
                )))
      ],
    ));
  }
}
