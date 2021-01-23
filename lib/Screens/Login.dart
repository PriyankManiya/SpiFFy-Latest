import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../conStant.dart';
import 'OtpScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/bg.png",
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "LogIn",
                              style: Constant.Text30_Bold_White,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Enter your phone no to Login",
                              style: Constant.Text_w500_White,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    child: DropdownButtonFormField(
                                        dropdownColor: Colors.black,
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent)),
                                            contentPadding:
                                                EdgeInsets.only(left: 2)),
                                        value: "+91",
                                        items: [
                                          '+1',
                                          '+91',
                                          '+92',
                                          '+12',
                                          '+10'
                                        ]
                                            .map((String unit) =>
                                                DropdownMenuItem<String>(
                                                    value: unit,
                                                    child: Text(
                                                      unit,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    )))
                                            .toList(),
                                        onChanged: (value) => setState(() {})),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  flex: 4,
                                  child: TextField(
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.white,
                                    decoration: new InputDecoration(
                                      focusedBorder: new OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(10.0),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2)),
                                      hintStyle: new TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                      ),
                                      hintText: "Enter your Phone Number",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                child: Text(
                                  "Send OTP",
                                  style:Constant.Text20_Bold_White,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OtpScreen(),
                                      ),
                                      (route) => false);
                                },
                                color: Constant.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/plate-2.png"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
