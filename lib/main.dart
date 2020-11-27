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

  double _headingTop = 100;
  double _loginWidth = 0;
  double _loginYOffset = 0;
  double _registerYOffset = 0;

  double _loginXOffset = 0;

  double windowWidth = 0; //I get container over there
  double windowHeight = 0;

  double _loginOpacity = 1;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_PageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB583d72);
        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 100;
        break;
      case 1:
        _backgroundColor = Color(0xFFBfd8c04);
        _headingColor = Colors.white;
        _loginYOffset = 270;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _headingTop = 90;
        break;
      case 2:
        _backgroundColor = Color(0xFFBfd8c04);
        _headingColor = Colors.white;
        _loginYOffset = 250;
        _registerYOffset = 270;
        _loginXOffset = 20;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _headingTop = 80;
    }
    return Stack(children: <Widget>[
      AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, //for spacing in these containers
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _PageState = 0;
                  });
                },
                child: AnimatedContainer(
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: Duration(milliseconds: 1000),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: _headingTop),
                          child: Text(
                            "Meet Free",
                            style: TextStyle(
                                color: _headingColor,
                                fontSize: 29,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(25),
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              "Join MeetFree app for free and attain & host your meeting for free",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: _headingColor, fontSize: 18),
                            ))
                      ],
                    )),
              ),
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
                              padding: EdgeInsets.all(25),
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
          )),
      GestureDetector(
        onTap: () {
          setState(() {
            _PageState = 2;
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          //---------------------------------------------------------------------
          //This container for transforming
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            children: <Widget>[
              PrimaryButton(
                btnText: "Login",
              ),
              SizedBox(
                height: 20,
              ),
              OutlineBtn(
                btnText: "Create new account",
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            _PageState = 1;
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          //---------------------------------------------------------------------
          //This container for transforming
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),

          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    margin:EdgeInsets.only(bottom:20),
                    child: Text("create a new account",
                      style : TextStyle(
                        fontSize: 20,
                      )
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(height: 20,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                  )
                ],
              ),
              Column(
                children: [
                  PrimaryButton(
                    btnText: "Create Account", //text for sign up
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlineBtn(
                    btnText: "Back to login",
                  )
                ],
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class PrimaryButton extends StatefulWidget {
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();

  final String btnText;
  PrimaryButton({this.btnText});
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB583d72), borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});
  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFB583d72),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Color(0xFFB583d72), fontSize: 16),
        ),
      ),
    );
  }
}
