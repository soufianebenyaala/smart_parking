import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Login/login_screen.dart';
import 'package:smartparkingv2/Screens/Signup/components/background.dart';
import 'package:smartparkingv2/Screens/Signup/components/or_divider.dart';
import 'package:smartparkingv2/Screens/Signup/components/social_icon.dart';
import 'package:smartparkingv2/Screens/validation/validation.dart';
import 'package:smartparkingv2/components/already_have_an_account_acheck.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/components/rounded_input_field.dart';
import 'package:smartparkingv2/components/rounded_password_field.dart';
import 'package:smartparkingv2/layouts/parking_layout.dart';
import 'package:smartparkingv2/services/user_manager.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String name = '';
    String phone = '';
    String address = '';
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/register.svg",
              height: size.height * 0.09,
            ),
            RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {
                name = value;
              },
              validator: (value)=> Validation.validateName(value),
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
              validator: (value)=> Validation.validateEmail(value),
            ),
            RoundedInputField(
              hintText: "Your Address",
              onChanged: (value) {
                address = value;
              },
              validator: (value)=> Validation.validateName(value),
            ),
            RoundedInputField(
              hintText: "Your Phone",
              onChanged: (value) {
                phone = value;
              },
              validator: (value)=> Validation.validateMobile(value),
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
              validator: (value)=> Validation.validatePassword(value),
            ),
            RoundedButton(
              width: size.width * 0.8,
              text: "SIGNUP",
              press: (context) async {
                await UserManager.performUserSignup(
                        name, email, address, phone, password)
                    .then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ParkingLayout();
                      },
                    ),
                  );
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: (context) async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // ignore: prefer_const_constructors
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
