import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';

import '../conStant.dart';

class Payment extends StatefulWidget {
  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;
  bool flipcard = true;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Card",
                      style: Constant.Text18_w700),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        flipcard = !flipcard;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 10),
                        child: Text("Flip",
                            style: Constant.Text15_w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CreditCard(
              width: width * 0.88,
              cardNumber: "5450 7879 4864",
              cardExpiry: "10/25",
              cardHolderName: "Alex Parker",
              cvv: "456",
              bankName: "Axis Bank",
              cardType: CardType
                  .masterCard, // Optional if you want to override Card Type
              showBackSide: flipcard,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("Wallet",
                  style:Constant.Text15_w700),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/gpay.png"),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Google Pay",
                          style: Constant.Text15_w700),
                      Text("alexparker10@ybl",
                          style:Constant.Text10_w500)
                    ],
                  ),
                  SizedBox(
                    width: width * 0.30,
                  ),
                  Text("Remove",
                      style: Constant.Text13_w500)
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/paytm.png"),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Paytm",
                          style: Constant.Text15_w700),
                      Text("alexparker10@ybl",
                          style: Constant.Text10_w500)
                    ],
                  ),
                  SizedBox(
                    width: width * 0.3,
                  ),
                  Text("Remove",
                      style: Constant.Text13_w500)
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
