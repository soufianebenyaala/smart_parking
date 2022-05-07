import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Login/login_screen.dart';
import 'package:smartparkingv2/Screens/Signup/signup_screen.dart';
import 'package:smartparkingv2/Screens/Welcome/components/background.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  final void Function(bool)? onLoginChange;

  const Body({this.onLoginChange});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO PARKING",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/log.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              width: size.width * 0.8,
              text: "LOGIN",
              press: (context) async {
                print("object");
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen(onLoginChange: this.widget.onLoginChange,);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              width: size.width * 0.8,
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: (context) async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
