import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  final void Function(bool)? onLoginChange;

  const LoginScreen({this.onLoginChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(onLoginChange: onLoginChange),
    );
  }
}
