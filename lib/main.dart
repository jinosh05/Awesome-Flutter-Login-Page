import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool checkboxvalue = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue[200],
                  width: 4,
                ),
                image: DecorationImage(
                    image: AssetImage(
                      "img/back.jpg",
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("img/logo.png"),
                      width: width / 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.70),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(
                                  bottom: 30,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter your Username";
                                    } else if (value.length >= 10) {
                                      return "Name too Long";
                                    } else if (value.length <= 5) {
                                      return "Name too short";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    hintText: "Enter Username",
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                ),
                              ),
                              Container(
                                height: 45,
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter your Password";
                                    } else if (value.length >= 10) {
                                      return "Password too Long";
                                    } else if (value.length <= 5) {
                                      return "Password too short";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  obscureText: !checkboxvalue,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.lock,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.only(right: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            Checkbox(
                              value: checkboxvalue,
                              focusColor: Colors.pink,
                              hoverColor: Colors.pink,
                              activeColor: Colors.pink,
                              onChanged: (value) {
                                setState(() {
                                  checkboxvalue = value;
                                });
                              },
                              checkColor: Colors.blue,
                            ),
                            Text("Show Password",
                                style: TextStyle(
                                    color: Colors.pink[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            child: RaisedButton(
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  print("Validated");
                                }
                                _key.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                    'Login In Successful',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                        fontSize: 24),
                                  ),
                                  duration: Duration(seconds: 2),
                                  action: SnackBarAction(
                                    label: 'Okay',
                                    onPressed: () {},
                                  ),
                                ));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 18),
                              ),
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            elevation: 0,
                            onPressed: () {},
                            color: Colors.transparent,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text("Don't have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 200,
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Register Now",
                                style: TextStyle(fontSize: 16),
                              ),
                              color: Colors.pink,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
