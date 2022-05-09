import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Login/components/background.dart';
import 'package:smartparkingv2/Screens/Signup/signup_screen.dart';
import 'package:smartparkingv2/Screens/validation/validation.dart';
import 'package:smartparkingv2/components/already_have_an_account_acheck.dart';
import 'package:smartparkingv2/components/rounded_button.dart';
import 'package:smartparkingv2/components/rounded_input_field.dart';
import 'package:smartparkingv2/components/rounded_password_field.dart';
import 'package:smartparkingv2/layouts/parking_layout.dart';
import 'package:smartparkingv2/services/user_manager.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  final void Function(bool)? onLoginChange;

  const Body({
    this.onLoginChange,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var email = '';
  var password = '';
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/register.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  email = value;
                },
                validator: (value) =>
                  Validation.validateEmail(value)
              ),
              RoundedPasswordField(onChanged: (value) {
                password = value;
              }, validator: (value) =>
                Validation.validatePassword(value)
              ),
              RoundedButton(
                  width: size.width * 0.8,
                  text: "LOGIN",
                  press: (context) async {
                    if ( _formKey.currentState!.validate()) {
                      //do what we have to do

                      await UserManager.performUserLogin(email, password)
                          // ignore: sdk_version_set_literal
                          .then((value) => {
                                value == null
                                    ? {
                                        widget.onLoginChange!(true),
                                      }
                                    : print(value),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ParkingLayout();
                                    },
                                  ),
                                )
                              });
                    }else{
                      return;
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: (context)  async {
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
      ),
    );
  }
}
