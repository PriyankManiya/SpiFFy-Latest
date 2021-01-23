import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spiffy/conStant.dart';

import 'Navigation.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String signature = "{{ app signature }}";

  @override
  void initState() {
    super.initState();
  }

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
                            const EdgeInsets.only(top: 70, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Verify",
                              style: Constant.Text30_Bold_White,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "OTP sent to +1 093 234 3285",
                              style: Constant.Text_w500_White,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            PinCodeTextField(
                              textStyle:Constant.Text18_Bold_White,
                              textInputType: TextInputType.number,
                              length: 6,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                activeColor: Colors.transparent,
                                inactiveColor: Colors.white,
                                inactiveFillColor: Colors.transparent,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.transparent,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {});
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                              appContext: null,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                child: Text(
                                  "Enter OTP",
                                  style: Constant.Text20_Bold_White,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Navigation_Screen(),
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
