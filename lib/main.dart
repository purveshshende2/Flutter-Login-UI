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

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB583d72);

  @override
  Widget build(BuildContext context) {
    switch (_PageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB583d72);
        break;
      case 1:
        _backgroundColor = Color(0xFFBfd8c04);
        _headingColor = Colors.white;
        break;
      case 2:
        _backgroundColor = Color(0xFFBfd8c04);
        _headingColor = Colors.white;
    }

    return AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1000),
        color: _backgroundColor,
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
                        color: _headingColor,
                        fontSize: 29,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Join app for free and attain & host your meeting for free",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: _headingColor, fontSize: 18),
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
                        if (_PageState != 0) {
                          _PageState = 0;
                        } else {
                          _PageState = 1;
                        }
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )), //Button
                      ),
                    )))
          ],
        ));
  }
}
